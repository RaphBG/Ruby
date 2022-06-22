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
            game.board[5][0] = game.red
            expect(game.empty_row?(0)).to eq(4)
        end

        it "3 is returned when two tokens are placed" do
            game.board[5][0] = game.red
            game.board[4][0] = game.yellow
            expect(game.empty_row?(0)).to eq(3)
        end
    end

    describe "#placing" do
        subject(:game) { Game.new }
        it "the token is placed at the last row of column 0" do
            game.placing(0)
            expect(game.board[5][0]).to eq(game.red)
        end

        it "the token is placed at the fourth row of column 0" do
            game.placing(0)
            game.turn += 1
            game.placing(0)
            expect(game.board[4][0]).to eq(game.yellow)
        end
    end

    describe "#full?" do
        subject(:game) { Game.new }
        it "return true"do
            game.board = Array.new(6) { Array.new(7) { game.red } }
            expect(game.full?).to eq true
        end
        it "return false"do
            expect(game.full?).to eq false
        end
    end

    describe '#check_row' do
        subject(:game) { Game.new }

        before do
            game.board[2][3] = game.red
            game.board[2][2] = game.red
            game.board[2][1] = game.red
            game.board[2][0] = game.red
        end

        context 'when it matches' do
            it 'returns true' do
                result = game.check_row(2, 0, game.red)
                expect(result).to be true
            end
        end
    end

    describe '#check_columns' do
        subject(:game) { Game.new }

        before do
            game.board[5][0] = game.red
            game.board[4][0] = game.red
            game.board[3][0] = game.red
            game.board[2][0] = game.red
        end

        context 'when it matches' do
            it 'returns true' do
                result = game.check_column(2, 0, game.red)
                expect(result).to be true
            end
        end
    end

    describe '#check_diagonal_right' do
        subject(:game) { Game.new }

        before do
            game.board[2][6] = game.red
            game.board[3][5] = game.red
            game.board[4][4] = game.red
            game.board[5][3] = game.red
        end

        context 'when it matches' do
            it 'returns true' do
                result = game.check_diagonal_right(2, 6, game.red)
                expect(result).to be true
            end
        end
    end

    describe '#check_diagonal_left' do
        subject(:game) { Game.new }
        before do
            game.board[0][2] = game.red
            game.board[1][3] = game.red
            game.board[2][4] = game.red
            game.board[3][5] = game.red
        end

        context 'when it matches' do
            it 'returns true' do
                result = game.check_diagonal_left(0, 2, game.red)
                expect(result).to be true
            end
        end
    end

end