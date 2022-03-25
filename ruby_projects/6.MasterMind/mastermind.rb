class MasterMind
  @@secret = ""
  @@used = []

  def play
    code
    turn = 1
    while turn <= 12
      puts"Turn #{turn}"
      player_code = gets.chomp
      win = choice(player_code)
      if win == true
        return
      end
      turn += 1
    end
    puts "Sorry, you failed"
  end

  def choice(player_code)
    return win?(player_code)
  end

  def win?(player_code)
    if player_code == @@secret
      puts "WIN"
      return true
    end
  end
  
  def code
    4.times do
      number = rand(0..9)
      while @@used.include?(number)
        number = rand(0..9)
      end  
      @@used.push(number)
      @@secret += number.to_s
    end
    puts "Voici le code"
    puts @@secret
  end
  
end

game = MasterMind.new
game.play
