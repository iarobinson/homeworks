require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "has fifty two cards" do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe "#deal" do
    it "deals from the top" do
      top = deck.cards.last
      deck.deal
      new_top = deck.cards.last

      expect(top).to_not eq(new_top)
    end

    it "returns a card" do
      expect(deck.deal).to be_a(Card)
    end

    it "has one less card after dealing" do
      deck_size = deck.cards.length
      deck.deal

      expect(deck.cards.length).not_to eq(deck_size)
    end
  end

  describe "#shuffle!" do
    it "shuffles itself" do
      cards_before = deck.cards.dup
      deck.shuffle!

      expect(deck.cards).not_to eq(cards_before)
    end
  end
end
