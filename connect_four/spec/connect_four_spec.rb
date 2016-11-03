
require 'connect_four'

describe ConnectFour do
  let(:connect_four) { ConnectFour.new }

  describe '#game_ends?' do

    it 'returns false if there isn\'t a winner and the board is not full' do

    end

    it 'returns true if there is a winner' do
      winning_setup = Array.new(7) { ["x", "x", "x", "x", nil, nil] }
      winning_board = Board.new(board: winning_setup)
      winning_game = ConnectFour.new(board: winning_board)
      expect(winning_game.game_end?( [5, 5] )).to be_truthy

    end

    it 'returns true if the board is full' do
      full_setup = []
      3.time do
        full_setup << %w(a b c d e f)
        full_setup << [1,2,3,4,5,6]
      end
      full_setup << %w(a b c d e f)

    end

  end

end
