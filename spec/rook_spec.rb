# frozen_string_literal: true

require 'chess'

describe 'Rook' do
  describe '#initialize' do
    let(:board) { Board.new }
    let(:rook1) { Rook.new([0, 7], board) }
    let(:rook2) { Rook.new([7, 7], board) }

    it 'sets the symbol according to starting position' do
      expect(rook1.symbol).to eq(:r)
      expect(rook2.symbol).to eq(:R)
    end
  end
end
