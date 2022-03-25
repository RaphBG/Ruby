class MasterMind
  @@secret = ""
  @@used = []

  def play
    code
    turn = 1
    while turn <= 12
      puts "Turn #{turn}"
      player_code = gets.chomp
      choice(player_code)
      turn += 1
    end
    puts "Sorry, you failed"
  end

  def choice(player_code)
    problem = false
    while player_code.length != 4
      puts "Code is too short or too long"
      player_code = gets.chomp
    end
    code_array = player_code.codepoints
    code_array.each do |number|
      if number.between?(48,57) != true
        problem = true
      end
    end
    if problem == true
      puts "Use numbers"
      redo_code
    end
    win?(player_code)
    hint(player_code)
  end
  
  def redo_code
    player_code = gets.chomp
    choice(player_code)
  end

  def win?(player_code)
    if player_code == @@secret
      puts "WIN"
      exit
    end
  end

  def hint(player_code)
    arr = player_code.split("")
    partial=0
    match=0
    arr.each_with_index do | data, index |
      if @@used[index] == data
        match+=1
      elsif @@used.include?(data)
        partial+=1
      end
    end
    puts "match: #{match}"
    puts "partial: #{partial}"
  end
  
  def code
    4.times do
      number = rand(0..9)
      while @@used.include?(number)
        number = rand(0..9)
      end  
      @@used.push(number.to_s)
      @@secret += number.to_s
    end
    print "Debug : Here is the code "
    puts @@secret
  end
end

game = MasterMind.new
game.play