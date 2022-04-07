class Game
  attr_accessor :board
  def initialize
    @board = Array.new(6) { Array.new(7) { "\u25cb" } }
  end
  
  def display
    grid = ""
    @board.map do |data|
      grid += "|"+data.join("|")+"|\n"
    end
    puts grid
  end
  
end
