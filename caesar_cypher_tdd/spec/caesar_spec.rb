require './lib/caesar_cypher.rb'

describe CaesarCypher do
    describe "#char2ascii" do
        subject(:cypher) { CaesarCypher.new("Hello",1) }
        it "Hello is in array of ascii" do
          expect(cypher.char2ascii).to eq([72,101,108,108,111])
        end
    end

    describe "#cypherUppercase" do
      subject(:cypher) { CaesarCypher.new("HELLO",1) }
      it "HELLO is cyphered +1" do
        cypher.arr = [72,69,76,76,79]
        expect(cypher.cypherUppercase).to eq([73,70,77,77,80])
      end

      it "Hello is cyphered +1" do
        cypher.arr = [72,101,108,108,111]
        expect(cypher.cypherUppercase).to eq([73,101,108,108,111])
      end

    end

end