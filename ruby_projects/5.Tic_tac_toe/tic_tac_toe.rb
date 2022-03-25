class Game
  @@board=[[1,2,3],[4,5,6],[7,8,9]]
  
  def board
    boardrow = ""
    @@board.map do |data|
      boardrow="| "+data.join(" ")+" |"
      puts boardrow
    end
  end
  
end

game = Game.new
game.board