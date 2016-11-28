require 'byebug'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def flush?
    flush_suit = cards.first.suit
    cards.all? { |card| card.suit == flush_suit }
  end

  def straight?
    values = []
    cards.each do |card|
      values << card.value
    end

    values.sort!
    values.each_with_index do |value, i|
      return true if i == values.length - 1
      return false unless values[i + 1] - value == 1
    end
  end

  def check_multiples
    counts = Hash.new { 0 }

    cards.each do |card|
      counts[card] += 1
    end

    multiples = counts.values.select { |c| c > 1 }
    multiples.each do |mult|
      
    end
  end
end
