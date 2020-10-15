# frozen_string_literal: true

require 'chess'

describe 'Queen' do
  describe '#initialize' do
    let(:board) { Board.new }
    let(:queen1) { Queen.new([0, 3], board) }
    let(:queen2) { Queen.new([7, 3], board) }

    it 'sets the symbol according to starting position' do
      expect(queen1.symbol).to eq(:q)
      expect(queen2.symbol).to eq(:Q)
    end
  end
end
