require './lib/caesar_cypher.rb'

describe CaesarCypher do
    describe "#char2ascii" do
        subject(:cypher) { CaesarCypher.new("Hello",1) }
        it "Hello is in array of ascii" do
          expect(cypher.char2ascii).to eq([72,101,108,108,111])
        end
    end

end