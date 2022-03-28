class MasterMind
  def initialize
    @secret_code = []
    @used = []
    @player_input_code = ""
    @continue = true
    generate_secret_code
  end

  def play
    turn = 1

    while @continue
      puts "Turn #{turn}"
      get_player_input

      @continue = false if stop_game?(turn)
      hint if @continue == true
      turn += 1
    end

    if win?
      puts "WIN"
    else
      puts "Sorry, you failed"
    end
    print @secret_code
  end

  def get_player_input
    player_input_invalid = true

    while player_input_invalid
      player_input_invalid = false

      @player_input_code = gets.chomp

      if @player_input_code.length != 4
        puts "Code is too short or too long"
        player_input_invalid = true
      end

      if !player_input_invalid && player_input_not_integer?
        puts "Use numbers"
        player_input_invalid = true
      end

      if !player_input_invalid && dupicate_value?
        puts "No duplicate value"
        player_input_invalid = true
      end
    end
  end

  def win?
    @player_input_code == @secret_code.join
  end

  def stop_game?(turn)
    @player_input_code == @secret_code.join ||
      turn > 12
  end

  def hint
    arr = @player_input_code.split("")
    partial = 0
    match = 0

    arr.each_with_index do |data, index|
      if @secret_code[index] == data
        match += 1
      elsif @secret_code.include?(data)
        partial += 1
      end
    end

    puts "match: #{match}"
    puts "partial: #{partial}"
  end

  def duplicate_value?
    @player_input_code.split('').uniq.count < 4
  end

  def player_input_not_integer?
    # J'avais l'intention de faire quelque chose de plus simple @player_input_code.to_i.t_s != @player_input_code
    # mais si notre code est 0123 converti en string puis en integer ça nous retourne 123
    @player_input_code.split('').any? { |string| string.to_i.to_s != string }

    # utiliser une regex ça marche aussi si tu ne sais pas ce que c'est tu peux me ping
  end

  def generate_secret_code
    while @secret_code.size < 4 do
      number = rand(0..9)

      if !@used.include?(number.to_s)
        @used.push(number.to_s)
        @secret_code.push(number.to_s)
      end
    end
  end
end

game = MasterMind.new
game.play
