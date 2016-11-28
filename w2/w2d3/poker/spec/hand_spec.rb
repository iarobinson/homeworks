require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }

  describe '#initialize' do
    it 'starts cards with an empty array' do

      expect(hand.cards).to be_empty
    end
  end

  describe '#straight_flush' do
    # it 'returns true if flush and straight' do
    #   hand.card = []
    # end
  end

  describe '#flush?' do
    it 'returns true if all cards are the same suit' do
      hand.cards = [Card.new(2, :hearts), Card.new(4, :hearts),
                    Card.new(6, :hearts), Card.new(8, :hearts),
                    Card.new(10, :hearts)]

      expect(hand.flush?).to be true
    end

    it 'returns false when its not a flush' do
      hand.cards = [Card.new(2, :diamonds), Card.new(4, :hearts),
                    Card.new(6, :hearts), Card.new(8, :hearts),
                    Card.new(10, :hearts)]

      expect(hand.flush?).to be false
    end
  end

  describe '#straight?' do
    it 'returns true if all cards are sequential' do
      hand.cards = [Card.new(2, :hearts), Card.new(3, :hearts),
                    Card.new(5, :diamonds), Card.new(4, :hearts),
                    Card.new(6, :hearts)]

      expect(hand.straight?).to be true
    end

    it 'returns false when its not a straight' do
      hand.cards = [Card.new(10, :hearts), Card.new(3, :hearts),
                    Card.new(5, :diamonds), Card.new(4, :hearts),
                    Card.new(6, :hearts)]

      expect(hand.straight?).to be false
    end
  end

  describe '#check_multiples' do
    it 'returns four of a kind when four cards have same value' do
      hand.cards = [Card.new(12, :hearts), Card.new(12, :clubs),
                    Card.new(12, :diamonds), Card.new(12, :spades),
                    Card.new(6, :hearts)]

      expect(hand.check_multiples).to eq(:four_of_a_kind)
    end

    it 'returns full house with two of a kind and three of a kind' do
      hand.cards = [Card.new(12, :hearts), Card.new(12, :clubs),
                    Card.new(12, :diamonds), Card.new(6, :spades),
                    Card.new(6, :hearts)]

      expect(hand.check_multiples).to eq(:full_house)
    end

    it 'returns three of a kind when three cards have the same value' do
      hand.cards = [Card.new(12, :hearts), Card.new(12, :clubs),
                    Card.new(12, :diamonds), Card.new(7, :spades),
                    Card.new(6, :hearts)]

      expect(hand.check_multiples).to eq(:three_of_a_kind)
    end

    it 'returns two pair when there are two pairs' do
      hand.cards = [Card.new(12, :hearts), Card.new(12, :clubs),
                    Card.new(7, :diamonds), Card.new(7, :spades),
                    Card.new(6, :hearts)]

      expect(hand.check_multiples).to eq(:two_pair)
    end

    it 'returns pair when there is a pair' do
      hand.cards = [Card.new(12, :hearts), Card.new(12, :clubs),
                    Card.new(2, :diamonds), Card.new(7, :spades),
                    Card.new(6, :hearts)]

      expect(hand.check_multiples).to eq(:pair)
    end
  end
end
