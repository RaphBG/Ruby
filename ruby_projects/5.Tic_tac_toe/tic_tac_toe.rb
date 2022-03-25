require 'io/console'
class Game
  @@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @@board = [[1,2,3],[4,5,6],[7,8,9]]
  @@used = []
  
  def board
    boardrow = ""
    @@board.map do |data|
      boardrow = "| "+data.join(" ")+" |"
      puts boardrow
    end
  end

  def play
    board
    turn=1
    puts "Turn ##{turn}"
    index = gets.to_i
    while turn <= 9
      index = position_impossible?(index)
      index = already_used?(index)
      @@used.push(index)
      placing(index, turn)
      turn += 1
      if turn <= 9
        puts "Turn ##{turn}"
        index = gets.to_i
      end
    end
  end

  def position_impossible?(index)
    if(index.between?(0,9) == false)
      while index.between?(0,9) == false
        puts "this position doesn't exist"
        index = gets.to_i
      end  
    end
    return index
  end

  def already_used?(index)
    if(@@used.include?(index))
      while @@used.include?(index) || index.between?(0,9) == false
        if(index.between?(0,9) == false)
          puts "this position doesn't exist"
        else
          puts "this position has already been played"
        end
        index = gets.to_i
      end
    end
    return index
  end

  def placing(index, turn)
    @@board.each_with_index do |data, index_r|
      data.each_with_index do |position, index_c|
        if position == index
          if turn.odd?
            @@board[index_r][index_c] = "x"
          else
            @@board[index_r][index_c] = "o"
          end
          board
        end
      end
    end
  end
  
end

game = Game.new
game.play