require_relative "constants"
require_relative "card"

class Deck
  include Constants

  attr_reader :deck

  def initialize
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank_name, rank_value|
        @deck << Card.new(suit[1], rank_name, rank_value)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def pop
    @deck.pop
  end

  def deal_remainder
    dealt = @deck
    @deck = []
    
    dealt
  end

  private
end