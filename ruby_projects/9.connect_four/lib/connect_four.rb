class Game
  attr_accessor :board, :yellow, :red
  def initialize
    @board = Array.new(6) { Array.new(7) { "\u25cb" } }
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
    @board[index][column] = "X"
  end

  def empty_row?(column)
    index=0
    while index != 5
      index+=1
      if  @board[index][column] == "X"
        index-=1
        break
      end
    end
    index
  end

  def full?
    full = 0
    @board.map do |data|
      if data.none?("\u25cb")
        full +=1
      end
    end
    if full == 6 
      return true
    end
    return false
  end
  
end

# game = Game.new