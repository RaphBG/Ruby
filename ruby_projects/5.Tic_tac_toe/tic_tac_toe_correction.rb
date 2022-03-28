class Game
  def initialize
    @win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @board = [[1,2,3],[4,5,6],[7,8,9]]
    @used = []
    @player1 = []
    @player2 = []
  end

  def display_board
    @board.each do |data|
      puts "| #{data.join(" ")} |"
    end
  end

  def play
    turn = 1

    while !player1_win? && !player2_win? && turn <= 9
      display_board
      puts "Turn ##{turn}"
      puts "Player #{turn.odd? ? 1 : 2} turn!"

      input = get_input

      @used.push(input)

      placing(input, turn)

      turn += 1
    end

    if player1_win?
      puts "Player 1 wins!"
    elsif player2_win?
      puts "Player 2 wins!"
    else
      puts "No one win !"
    end
  end

  def get_input
    input = ""

    while input == "" || @used.include?(input) || input.between?(1, 9) == false
      input = gets.chomp

      if input == ""
        puts "Invalid value"
        next
      end

      input = input.to_i

      if input.between?(1, 9) == false
        puts "This position doesn't exist"
      elsif @used.include?(input)
        puts "This position has already been played"
      end
    end

    input
  end

  def placing(input, turn)
    @board.each_with_index do |data, index_r|
      data.each_with_index do |position, index_c|
        if position == input
          if turn.odd?
            @board[index_r][index_c] = "x"
            @player1.push(input)
          else
            @board[index_r][index_c] = "o"
            @player2.push(input)
          end
        end
      end
    end
  end

  def player1_win?
    @win.each do |data|
      if (data - @player1).empty?
        return true
      end
    end
    false
  end

  def player2_win?
    @win.each do |data|
      if (data - @player2).empty?
        return true
      end
    end
    false
  end
end

game = Game.new
game.play
