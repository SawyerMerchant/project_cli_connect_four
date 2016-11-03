require 'board'

describe Board do

  let(:board) { Board.new }

  context 'a new board' do

    describe '#board' do

      it 'returns an empty board' do
        expect(board).to_not be_nil
      end
    end
  end
end