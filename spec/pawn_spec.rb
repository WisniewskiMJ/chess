# frozen_string_literal: true

require 'chess'

describe 'Pawn' do
  let(:board) { Board.new }
  describe '#initialize' do
    let(:pawn1) { Pawn.new([1, 2], board) }
    let(:pawn2) { Pawn.new([6, 2], board) }

    it 'sets the symbol according to starting position' do
      expect(pawn1.symbol).to eq(:p)
      expect(pawn2.symbol).to eq(:P)
    end
  end

  describe '#moves' do
    context 'when on starting position' do
      let(:pawn) { Pawn.new([1, 2], board) }
      it 'returns array with 1 and 2 fields forward positions' do
        expect(pawn.moves).to eq([[2, 2], [3, 2]])
      end
    end
    context 'when not on starting position' do
      let(:pawn) { Pawn.new([4, 2], board) }
      it 'returns array with 1 field forward position' do
        expect(pawn.moves).to eq([[3, 2]])
      end
    end
    context 'when on attacking position' do
      let(:pawn_attacking) { Pawn.new([2, 3], board) }
      let(:pawn_attacked) { Pawn.new([1, 2], board) }
      it 'returns array with 1 and 2 fields forward positions' do
        expect(pawn_attacking.moves).to include(pawn_attacked.pos)
      end
    end
  end
end
