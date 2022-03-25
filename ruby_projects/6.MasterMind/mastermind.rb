class MasterMind
  @@secret = ""
  @@used = []
  
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
game.code
