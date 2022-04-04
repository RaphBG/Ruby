class Game
  attr_reader :board, :yellow, :red
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
  
end

game = Game.new