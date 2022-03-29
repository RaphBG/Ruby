class Hangman
    
    def initialize
        @secret_word = ""
        @miss = []
        @try = 10
        words = File.readlines('words.txt')
        number = rand(0..9894)

        if words[number].chomp.length.between?(5,12)
            @secret_word = words[number].chomp
            puts @secret_word
        elsif !words[number].chomp.length.between?(5,12)
            initialize
        end

        @hidden = Array.new(@secret_word.length)
        @hidden.each_with_index do |data, index|
            @hidden[index]="_"
        end
    end

    def game
        while @try !=0 && !win?
            puts "Guess: #{@hidden.join(' ')}"
            puts "Miss: #{@miss.join(',')}"
            choice
        end
        puts "The word was #{@secret_word}."
        if win?
            puts "Good Job !"
        else
            puts "You failed"
        end
    end

    def choice 
        puts "Write a downcase letter"
        player_choice=gets.chomp
        while player_choice.ord.between?(97,122) != false && player_choice.length != 1
            puts "Write a downcase letter"
            player_choice = gets.chomp
        end
        in?(player_choice)
    end

    def in?(player_choice)
        if @secret_word.split("").include?(player_choice)
            @secret_word.split("").each_with_index do |letter,index|
                if letter == player_choice
                    @hidden[index] = letter
                end
            end
        else
            @miss.push(player_choice)
            @try-=1
        end
    end

    def win?
        @hidden.join('') == @secret_word
    end
    
end

game = Hangman.new
game.game