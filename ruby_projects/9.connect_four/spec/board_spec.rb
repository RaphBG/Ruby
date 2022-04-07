require './lib/connect_four.rb'

describe Game do
    describe "#initialize" do
        subject(:game) { Game.new }
        it "board is initialized" do
          expect(game.board).not_to be(nil)
        end
    end
end