# frozen_string_literal: true

require 'chess'

describe 'Board' do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'sets @rows to be 2D array with 8 rows and 8 columns' do
      rows = board.instance_variable_get(:@rows)
      expect(rows.length).to eq(8)
      expect(rows[0].length).to eq(8)
    end

    it 'populates board with pieces' do
      rows = board.rows
      expect(rows[0][0]).to be_a(Piece)
      expect(rows[7][7]).to be_a(Piece)
      expect(rows[3][1]).to be_nil
    end
  end

  describe '#[]' do
    it 'returns element on board at given position' do
      rows = board.rows
      rows[4][4] = 'x'
      pos1 = [4, 4]
      expect(board[pos1]).to eq('x')
    end
  end

  describe '#[]=' do
    let(:value) { double('value') }
    it 'sets given board position to given value' do
      pos = [5, 5]
      board[pos] = value
      expect(board[pos]).to eq(value)
    end
  end

  describe '#add_piece' do
    it 'sets a piece at adequate position' do
      pos1 = [0, 0]
      pos2 = [7, 4]
      pos3 = [1, 3]
      board.add_piece(pos1)
      board.add_piece(pos2)
      board.add_piece(pos3)
      expect(board[pos1]).to be_a(Rook)
      expect(board[pos2]).to be_a(King)
      expect(board[pos3]).to be_a(Pawn)
    end
  end

  describe '#pieces' do
    it 'returns array of all pieces on chessboard' do
      expect(board.pieces.all? { |piece| piece.is_a?(Piece) }).to eq(true)
      rows = board.instance_variable_get(:@rows)
      pieces_count = 0
      (0..7).each do |x|
        (0..7).each do |y|
          pieces_count += 1 if rows[x][y].is_a?(Piece)
        end
      end
      expect(board.pieces.count).to eq(pieces_count)
    end
  end

  describe '#on_chessboard?' do
    it 'returns true if position is on chessboard and false otherwise' do
      expect(board.on_chessboard?([9, 9])).to eq(false)
      expect(board.on_chessboard?([4, 5])).to eq(true)
    end
  end

  describe '#move_piece' do
    let(:pos1) { [1, 2] }
    let(:pos2) { [3, 4] }
    let(:piece) { double 'piece' }
    before do
      allow(piece).to receive(:pos).and_return(pos2)
      allow(piece).to receive(:pos=)
    end

    it 'raises error if there is no piece at start position' do
      expect { board.move_piece([9, 9], pos2) }.to raise_error('No piece at starting position')
    end

    it 'raises error if piece can not move to end position' do
      expect { board.move_piece(pos1, [-1, 9]) }.to raise_error("Can't move to end position")
    end

    it 'sets chessboard field at start position to nil' do
      board[pos1] = piece
      board.move_piece(pos1, pos2)
      expect(board[pos1]).to be_nil
    end

    it 'sets chessboard field at end position to contain piece' do
      board[pos1] = piece
      board.move_piece(pos1, pos2)
      expect(board[pos2]).to eq(piece)
    end

    it 'updates piece.pos to end position' do
      board[pos1] = piece
      board.move_piece(pos1, pos2)
      expect(piece.pos).to eq(pos2)
    end
  end
end
