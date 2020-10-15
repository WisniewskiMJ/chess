require 'chess'

describe 'Piece' do

  describe '#initialize' do
    let(:position1) {[0,2]}
    let(:position2) {[7,2]}
    let(:board) {Board.new}
    let(:piece1) {Piece.new(position1, board)}
    let(:piece2) {Piece.new(position2, board)}

    it 'sets @pos to position on chessboard' do
      expect(piece1.pos).to eq(position1)
    end

    it 'sets @board to instance of Board' do
      expect(piece1.board).to be_a(Board)
    end

    it 'sets the color according to starting position' do
      expect(piece1.color).to eq(:black)  
      expect(piece2.color).to eq(:white)  
    end

    it 'sets the symbol according to starting position' do
      expect(piece1.symbol).to eq(:x)  
      expect(piece2.symbol).to eq(:X)  
    end
  end

end
