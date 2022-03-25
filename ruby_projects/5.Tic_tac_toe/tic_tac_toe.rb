class Game
  @@board=[[1,2,3],[4,5,6],[7,8,9]]
  
  def board
    boardrow = ""
    @@board.map do |data|
      boardrow="| "+data.join(" ")+" |"
      puts boardrow
    end
  end

  def choice(index)

    @@board.each_with_index do |data, index_r|
      data.each_with_index do |position, index_c|
        if position == index
          @@board[index_r][index_c] = "x"
          board
        end
      end
    end
    
  end
  
end

game = Game.new
game.board
index = gets.to_i
game.choice(index)