# frozen_string_literal: true

require 'chess'

describe 'Knight' do
  describe '#initialize' do
    let(:board) { Board.new }
    let(:knight1) { Knight.new([0, 1], board) }
    let(:knight2) { Knight.new([7, 6], board) }

    it 'sets the symbol according to starting position' do
      expect(knight1.symbol).to eq(:n)
      expect(knight2.symbol).to eq(:N)
    end
  end
end
