class Card
  attr_reader :suit
  attr_reader :rank_key
  attr_reader :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @rank_key = value[0]
    @value = value[1]
  end

  def display
    [suit[:symbol], rank_key].join('')
  end

  def color
    suit[:color]
  end
end