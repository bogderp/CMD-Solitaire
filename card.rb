class Card
  attr_reader :suit
  attr_reader :rank_key

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @rank_key = value[0]
    @value = value[1]
  end

  private
end