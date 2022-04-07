class CaesarCypher
    attr_accessor :arr

    def initialize(str, nbr)
        @str = str
        @nbr = nbr
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

end
