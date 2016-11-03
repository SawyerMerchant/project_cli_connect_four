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

  describe '#add_piece' do

    it 'adds one piece to the given column if the column is in bounds' do
      # less coupled w/ array
      #column_number = 3
      #board.add_piece(column_number, "T")
      #piece_count_column_3 = board.column(column_number).count { |e| !e.nil? }
      #expect(piece_count_column_3).to eq(1)
      # coupled w/ array
      column_number = 0
      board.add_piece(column_number, "T")
      expect(board.board[0][0]).to eq("T")
    end

    it 'returns false if column is out of bounds' do
      column_number = board.board.length
      expect(board.add_piece(column_number, "X")).to eq(false)
    end

    it 'returns false if column is full' do
      column_number = 0
      column = board.board[0]
      column.length.times do
        board.add_piece(column_number, "T")
      end
      expect(board.add_piece(column_number, "X")).to eq(false)
    end

  end

  describe '#winner?' do

    it 'returns false if there are not 4 identical pieces connected' do
      board.add_piece(0, "X")
      2.times { board.add_piece(1, "X") }
      3.times { board.add_piece(2, "X") }
      expect(board.winner?([2,2])).to be_falsy
    end

    it 'returns true if there are 4 identical pieces connected vertically' do
      4.times { board.add_piece(2, "X") }
      expect(board.winner?([2,3])).to be_truthy
    end

    it 'returns true if there are 4 identical pieces connected horizontally' do
      4.times { |column_num| board.add_piece(column_num, "x")}
      expect(board.winner?([5,5])).to be_truthy
    end

    it 'returns true if there are 4 identical pieces connected on a positive diagonal' do
      board.add_piece(0, "X")
      2.times { board.add_piece(1, "X") }
      3.times { board.add_piece(2, "X") }
      board.add_piece(3, "O")
      3.times { board.add_piece(3, "X") }
      expect(board.winner?([4,4])).to be_truthy
    end

    it 'returns true if there are 4 identical pieces connected on a negative diagonal' do
      board.add_piece(0, "O")
      3.times { board.add_piece(0, "X") }
      3.times { board.add_piece(1, "X") }
      2.times { board.add_piece(2, "X") }
      board.add_piece(3, "X")
      expect(board.winner?([0,4])).to be_truthy
    end

  end

  describe '#rows' do

    it 'returns all the boards rows' do
      columns, rows = 7, 6
      board.rows.each do |row|
        expect(row.length).to eq(columns)
      end
      expect(board.rows.length).to eq(rows)
      expect(board.rows).to_not eq(board.board)
    end

  end

  describe '#full?' do
    before(:each) do
      columns, rows = 6, 6
      columns.downto(1) do |column_number|
        rows.times { board.add_piece(column_number, "X") }
      end
      rows.downto(2) { board.add_piece(0, "X") }
    end

    it 'returns false if the board is not full' do
      expect(board.full?).to be_falsy
    end

    it 'returns true if the board is full' do
      board.add_piece(0, "X")
      expect(board.full?).to be_truthy
    end

  end

end
