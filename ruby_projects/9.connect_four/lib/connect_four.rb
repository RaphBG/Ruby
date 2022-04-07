require 'colorize'

class Game
  attr_accessor :board, :red, :yellow, :turn
  def initialize
    @board = Array.new(6) { Array.new(7) { "\u25cb" } }
    @yellow = "\u25cf".yellow
    @red = "\u25cf".red
    @turn = 1
  end

  def play
    while full? != true
      display
      puts "Turn ##{@turn}"
      if @turn.odd?
        puts "Turn of player "+"1".red 
      else 
        puts "Turn of player "+"2".yellow
      end
      choice = gets.to_i
      placing(choice)
      if win? == true
        break
      end
      @turn+=1
    end
  end
  
  def display
    grid = ""
    @board.map do |data|
      grid += "|"+data.join("|")+"|\n"
    end
    puts grid
  end

  def placing(column)
    problem(column)
    full_column?(column)
    index = empty_row?(column)
    @board[index][column] = @turn.odd? ? @red : @yellow
  end

  def empty_row?(column)
    index=0
    while index != 5
      index+=1
      if  @board[index][column] != "\u25cb"
        index-=1
        break
      end
    end
    index
  end

  def problem(column)
    if !column.between?(0,6)
      puts "Choose between 0 and 6"
      sleep 1
      play
    end
  end

  def full?
    full = 0
    @board.map do |data|
      full += 1 if data.none?("\u25cb")
    end
    full == 6 ? true : false
  end

  def full_column?(column)
    if @board[0][column] != "\u25cb"
      puts "Choose an other columns !"
      sleep 1
      play
    end
  end

  def win?
    6.times do |row|
      7.times do |column|
        symbol = @turn.odd? ? @red : @yellow
        if check(row, column, symbol)
          if @turn.odd?
            display
            puts "The player "+"1".red+" win !"
            return true
          else
            display
            puts "the player "+"2".yellow+" win !"
            return true
          end
        end
      end
    end
  end

  def check(row, column, symbol)
    check_row(row, column, symbol) || check_column(row, column, symbol) || check_diagonals(row, column, symbol)
  end

  def check_row(row, column, symbol)
    return if column > 3
    @board[row][column]==symbol && @board[row][column+1]==symbol && @board[row][column+2]==symbol && @board[row][column+3]==symbol
  end

  def check_column(row, column, symbol)
    return if row > 2
    @board[row][column]==symbol && @board[row+1][column]==symbol && @board[row+2][column]==symbol && @board[row+3][column]==symbol
  end

  def check_diagonal_right(row, column, symbol)
    return if column < 3
    @board[row][column] == symbol && @board[row + 1][column - 1] == symbol && @board[row + 2][column - 2] == symbol && @board[row + 3][column - 3] == symbol
  end

  def check_diagonal_left(row, column, symbol)
    return if column > 3
    @board[row][column] == symbol && @board[row + 1][column + 1] == symbol && @board[row + 2][column + 2] == symbol && @board[row + 3][column + 3] == symbol
  end

  def check_diagonals(row, column, symbol)
    return unless row < 3
    check_diagonal_right(row, column, symbol) || check_diagonal_left(row, column, symbol)
  end
  
end

# game = Game.new
# game.play
