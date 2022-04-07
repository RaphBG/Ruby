require './lib/connect_four.rb'

describe Game do
    describe "#initialize" do
        subject(:game) { Game.new }
        it "board is initialized" do
          expect(game.board).not_to be(nil)
        end
    end

    describe "#empty_row?" do
        subject(:game) { Game.new }
        it "5 is returned when no tokens are placed" do
            expect(game.empty_row?(0)).to eq(5)
        end

        it "4 is returned when a token is placed" do
            game.board[5][0]="X"
            expect(game.empty_row?(0)).to eq(4)
        end

        it "3 is returned when two tokens are placed" do
            game.board[5][0]="X"
            game.board[4][0]="X"
            expect(game.empty_row?(0)).to eq(3)
        end
    end

    describe "#placing" do
        subject(:game) { Game.new }
        it "the token is placed at the last row of column 0" do
            game.placing(0)
            expect(game.board[5][0]).to eq("X")
        end

        it "the token is placed at the fourth row of column 0" do
            game.placing(0)
            game.placing(0)
            expect(game.board[4][0]).to eq("X")
        end
    end

    describe "#full?" do
        subject(:game) { Game.new }
        it "return true"do
            game.board = Array.new(6) { Array.new(7) { "X" } }
            expect(game.full?).to eq true
        end
        it "return false"do
            expect(game.full?).to eq false
        end
    end

end