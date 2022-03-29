class Hangman
    
    def initialize
        words = File.readlines('words.txt')
        number = rand(0..9894)
        @secret_word = words[number].chomp
        puts @secret_word
    end
    
end

game = Hangman.new