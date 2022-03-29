class Hangman
    
    def initialize
        @miss = []
        words = File.readlines('words.txt')
        number = rand(0..9894)

        if words[number].chomp.length.between?(5,12)
            @secret_word = words[number].chomp
            puts @secret_word
        else
            initialize
        end
        @hidden = Array.new(@secret_word.length)
        @hidden.each_with_index do |data, index|
            @hidden[index]="_"
        end
    end

    def game
        puts "Guess: #{@hidden.join(' ')}"
        puts "Miss: #{@miss.join(',')}"
        choice
    end

    def choice 
        puts "Write a downcase letter"
        player_choice=gets.chomp
        while player_choice.ord.between?(97,122) != false && player_choice.length != 1
            puts "Write a downcase letter"
            player_choice = gets.chomp
        end
        puts player_choice
    end
    
end

game = Hangman.new
game.game
