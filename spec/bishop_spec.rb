# frozen_string_literal: true

require 'chess'

describe 'Bishop' do
  describe '#initialize' do
    let(:board) { Board.new }
    let(:bishop1) { Bishop.new([0, 2], board) }
    let(:bishop2) { Bishop.new([7, 2], board) }

    it 'sets the symbol according to starting position' do
      expect(bishop1.symbol).to eq(:b)
      expect(bishop2.symbol).to eq(:B)
    end
  end
end
