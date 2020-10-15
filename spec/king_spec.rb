# frozen_string_literal: true

require 'chess'

describe 'King' do
  describe '#initialize' do
    let(:board) { Board.new }
    let(:king1) { King.new([0, 4], board) }
    let(:king2) { King.new([7, 4], board) }

    it 'sets the symbol according to starting position' do
      expect(king1.symbol).to eq(:k)
      expect(king2.symbol).to eq(:K)
    end
  end
end
