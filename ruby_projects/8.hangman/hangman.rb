require 'yaml'

class Hangman
    
    def initialize
        @try = 10
        @miss = []
        @used = []
        words = File.readlines('words.txt')
        number = rand(0..9894)

        if words[number].chomp.length.between?(5,12)
            @secret_word = words[number].chomp
        elsif !words[number].chomp.length.between?(5,12)
            initialize
        end

        @hidden = Array.new(@secret_word.length)
        @hidden.each_with_index do |data, index|
            @hidden[index]="_"
        end
    end

    def game(game)
        game = game
        while @try !=0 && !win?
            puts "Guess: #{@hidden.join(' ')}"
            puts "Miss: #{@miss.join(',')}"
            saving = 0
            choice
            puts "Guess: #{@hidden.join(' ')}"
            puts "Miss: #{@miss.join(',')}"
            puts "Do you want to save(1) or continue(2) ?"
            while !saving.between?(1,2)
                saving = gets.to_i
            end
            if saving == 1
                save(game)
            end
        end
        puts "The word was #{@secret_word} !"
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
        while !player_choice.ord.between?(97,122) || player_choice.length != 1 || @used.include?(player_choice)
            if @used.include?(player_choice)
                puts "Write a downcase letter that's never been used"
            else
                puts "Please, write a downcase letter"
            end
            player_choice = gets.chomp
        end
        @used.push(player_choice)
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

    def save(game)
        Dir.mkdir('saved') unless Dir.exist?('saved')
        filename = "save"
        return false unless filename
        dump = YAML.dump(game)
        File.open(File.join(Dir.pwd, "saved/save.yaml"), 'w') { |file| file.write dump }
    end
    
    def load
        if File.exist?("saved/save.yaml")
            saved = File.open(File.join(Dir.pwd, "saved/save.yaml"), 'r')
            loaded_game = YAML.load(saved)
            saved.close
            puts "Your previous saved game has been loaded."
            loaded_game
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
    game = game.load
    game.game(game)
else
    game.game(game)
end