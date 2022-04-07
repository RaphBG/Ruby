class Game
  attr_accessor :board, :red, :yellow, :turn
  def initialize
    @board = Array.new(6) { Array.new(7) { "\u25cb" } }
    @yellow = "\e[1;33m\u25cf\e[0m"
    @red = "\e[31m\u25cf\e[0m"
    @turn = 1
  end
  
  def display
    grid = ""
    @board.map do |data|
      grid += "|"+data.join("|")+"|\n"
    end
    puts grid
  end

  def placing(column)
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

  def check_row(row, column, symbol)
    return if column > 3
    @board[row][column]==symbol && @board[row][column+1]==symbol && @board[row][column+2]==symbol && @board[row][column+3]==symbol
  end

  def check_column(row, column, symbol)
    return if row > 2
    @board[row][column]==symbol && @board[row+1][column]==symbol && @board[row+2][column]==symbol && @board[row+3][column]==symbol
  end
  
end
