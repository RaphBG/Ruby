class board

    def initialize
      @board = Array.new(6) { Array.new(7) { "\u25cb" } }
      @yellow = "\e[1;33m\u25cf\e[0m"
      @red = "\e[31m\u25cf\e[0m"
      @turn = 1
    end
    
    def display
      @board.map do |data|
        puts "|"+data.join("|")+"|\n"
      end
    end
    
end
  
game = Game.new
game.display