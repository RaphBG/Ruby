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
        cypher.arr = [72,69,76,76,79] #equal to use char2asccii method
        expect(cypher.cypherUppercase).to eq([73,70,77,77,80])
      end

      it "Hello is cyphered +1" do
        cypher.arr = [72,101,108,108,111] #equal to use char2asccii method
        expect(cypher.cypherUppercase).to eq([73,101,108,108,111])
      end

    end

    describe "#cypherDowncase" do
      subject(:cypher) { CaesarCypher.new("HEllO",1) }
      it "HEllO is cyphered +1" do
        cypher.arr = [72,69,108,108,79] #equal to use char2asccii method
        expect(cypher.cypherDowncase).to eq([72,69,109,109,79])
      end

      it "Hello is cyphered +1" do
        cypher.arr = [72,101,108,108,111] #equal to use char2asccii method
        expect(cypher.cypherDowncase).to eq([72,102,109,109,112])
      end
    end

    describe "#ascii2char" do
    subject(:cypher) { CaesarCypher.new("Hello",1) }
      it "Hello +1 in ascii is now in char" do
        cypher.arr = [73,102,109,109,112]
        expect(cypher.ascii2char).to eq(["I","f","m","m","p"])
      end
    end

end