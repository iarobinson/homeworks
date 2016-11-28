require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(11, :hearts) }

  describe "#initialize" do
    it "is initialized with value" do
      expect(card.value).to be_a(Integer)
      expect(card.value).to eq(11)
    end

    it "is initialized with suit" do
      expect(card.suit).to be_a(Symbol)
      expect(card.suit).to eq(:hearts)
    end
  end
end
