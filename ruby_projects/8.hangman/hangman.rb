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
        @hidden = Array.new(@secret_word.length)
        @hidden.each_with_index do |data, index|
            @hidden[index]="_"
        end
        puts @hidden.join(" ")
    end
    
end

game = Hangman.new
