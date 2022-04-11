require 'yaml'

class Game
    attr_accessor :try, :miss, :used, :hidden, :secret_word

    def initialize(try: 10, miss: [], used: [], hidden: nil, secret_word: nil)
        @try = try
        @miss = miss
        @used = used
        @hidden = hidden
        @secret_word = secret_word

        if @secret_word.nil?
            words = File.readlines('words.txt')

            while @secret_word.nil?
                number = rand(0..9894)
                if words[number].chomp.length.between?(5,12)
                    @secret_word = words[number].chomp
                end
            end
        end

        if @hidden.nil?
            @hidden = Array.new(@secret_word.length)
            @hidden.each_with_index do |data, index|
                @hidden[index]="_"
            end
        end
    end
end

class Hangman
    def initialize
        @game = Game.new
    end

    def game#(game)
        #game = game
        while @game.try !=0 && !win?
            puts "Guess: #{@game.hidden.join(' ')}"
            puts "Miss: #{@game.miss.join(',')}"
            saving = 0
            choice
            puts "Guess: #{@game.hidden.join(' ')}"
            puts "Miss: #{@game.miss.join(',')}"
            puts "Do you want to save(1) or continue(2) ?"
            while !saving.between?(1,2)
                saving = gets.to_i
            end
            if saving == 1
                save#(game)
            end
        end
        puts "The word was #{@game.secret_word} !"
        if win?
            puts "Good Job !"
        else
            puts "You failed"
        end
        File.delete("saved/save.yaml") if File.exist?("saved/save.yaml")
    end

    def choice
        puts "Write a downcase letter"
        player_choice = gets.chomp.to_s
        while !player_choice.ord.between?(97,122) || player_choice.length != 1 || @game.used.include?(player_choice)
            if @game.used.include?(player_choice)
                puts "Write a downcase letter that's never been used"
            else
                puts "Please, write a downcase letter"
            end
            player_choice = gets.chomp
        end
        @game.used.push(player_choice)
        in?(player_choice)
    end

    def in?(player_choice)
        if @game.secret_word.split("").include?(player_choice)
            @game.secret_word.split("").each_with_index do |letter,index|
                if letter == player_choice
                    @game.hidden[index] = letter
                end
            end
        else
            @game.miss.push(player_choice)
            @game.try-=1
        end
    end

    def win?
        @game.hidden.join('') == @game.secret_word
    end

    def save#(game)
        Dir.mkdir('saved') unless Dir.exist?('saved')
        filename = "save"
        return false unless filename
        dump = YAML.dump(@game)
        File.open(File.join(Dir.pwd, "saved/save.yaml"), 'w') { |file| file.write dump }
    end

    def load
        if File.exist?("saved/save.yaml")
            saved = File.open(File.join(Dir.pwd, "saved/save.yaml"), 'r')
            loaded_game = YAML.load(saved)
            saved.close
            puts "Your previous saved game has been loaded."
            @game = loaded_game
        else
            Hangman.new
        end
    end

end


game = Hangman.new
puts "Choose between load a game(1) or play(2)"
choice = 0
while !choice.between?(1,2)
    choice = gets.to_i
end

if choice == 1
    game.load
    game.game
else
    game.game
end
