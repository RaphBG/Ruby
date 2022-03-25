class Game
  @@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  @@board = [[1,2,3],[4,5,6],[7,8,9]]
  @@used = []
  @@player1 = []
  @@player2 = []
  
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
    puts "Player 1 turn!"
  
    index = gets.to_i
    while turn <= 9
      index = position_impossible(index)
      index = already_used(index)
      @@used.push(index)
      placing(index, turn)
      turn += 1
      if player1_win?
        puts "Player 1 wins!"
        return
      end
      if player2_win?
        puts "Player 2 wins!"
        return
      end
      if turn <= 9
        puts "Turn ##{turn}"
        if turn.odd?
          puts "Player 1 turn!"
        else
          puts "Player 2 turn!"
        end
        index = gets.to_i
      end
    end
    puts "No one win !"
  end

  def position_impossible(index)
    if(index.between?(0,9) == false)
      while index.between?(0,9) == false
        puts "This position doesn't exist"
        index = gets.to_i
      end  
    end
    return index
  end

  def already_used(index)
    if(@@used.include?(index))
      while @@used.include?(index) || index.between?(0,9) == false
        if(index.between?(0,9) == false)
          puts "This position doesn't exist"
        else
          puts "This position has already been played"
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
            @@player1.push(index)
          else
            @@board[index_r][index_c] = "o"
            @@player2.push(index)
          end
          board
        end
      end
    end
  end

  def player1_win?
    count=0
      @@win.each_with_index do |data, index_r|
        data.each_with_index do |position, index_c|
          @@player1.each_with_index do |choice, index|
            if position == choice
              count +=1
            end
            if count == 3
              return true
            end
          end
        end
      count=0
    end
    return false
  end

  def player2_win?
    count=0
      @@win.each_with_index do |data, index_r|
        data.each_with_index do |position, index_c|
          @@player2.each_with_index do |choice, index|
            if position == choice
              count +=1
            end
            if count == 3
              return true
            end
          end
        end
      count=0
    end
    return false
  end
  
end

game = Game.new
game.play
