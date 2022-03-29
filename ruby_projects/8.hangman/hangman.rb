class Hangman
    
    def initialize
        words = File.readlines('words.txt')
        number = rand(0..9894)

        if words[number].chomp.length.between?(5,12)
            @secret_word = words[number].chomp
            puts @secret_word
        else
            initialize
        end

    end
    
end

game = Hangman.new
