class Deck
  SUITS = [:hearts, :clubs, :spades, :diamonds].freeze
  attr_reader :cards

  def initialize
    @cards = deck_gen
  end

  def deck_gen
    new_cards = []

    SUITS.length.times do |index|
      (2..14).to_a.each do |value|
        new_cards << Card.new(value, SUITS[index])
      end
    end

    new_cards
  end

  def deal
    @cards.pop
  end

  def shuffle!
    @cards.shuffle!
  end
end
