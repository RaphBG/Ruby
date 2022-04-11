class CaesarCypher
    attr_accessor :arr

    def initialize(str, nbr)
        @str = str
        @nbr = nbr
    end

    def cypher
        char2ascii
        cypherUppercase
        cypherDowncase
        ascii2char
        @arr.join('')
    end

    def char2ascii
        @arr = @str.codepoints
    end

    def cypherUppercase
        @arr.each_with_index do |letter,index| 
            if letter.between?(65,90)
                if @arr[index] + @nbr > 90
                    rest = (@arr[index] + @nbr)-91
                    @arr[index] = (65 + rest)
                else
                    @arr[index] = (@arr[index] + @nbr)
                end
            end
        end
    end

    def cypherDowncase
        @arr.each_with_index do |letter,index| 
            if letter.between?(97,122)
                if @arr[index] + @nbr > 122
                    rest = (@arr[index] + @nbr)-123
                    @arr[index] = (97 + rest)
                  else
                    @arr[index] = (@arr[index] + @nbr)
                  end
            end
        end
    end

    def ascii2char
        @arr.each_with_index do |letter,index|
            @arr[index] = @arr[index].chr
        end
    end

end
