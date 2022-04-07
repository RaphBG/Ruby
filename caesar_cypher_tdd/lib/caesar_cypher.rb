class CaesarCypher
    attr_accessor :arr

    def initialize(str, nbr)
        @str = str
        @nbr = nbr
    end

    def char2ascii
        @arr = @str.codepoints
    end

end
