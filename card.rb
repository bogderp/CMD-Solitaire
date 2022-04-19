class Card
  attr_reader :suit
  attr_reader :rank_key
  attr_reader :value

  def initialize(suit, rank, value)
    @suit = suit
    @rank = rank
    @rank_key = value[0]
    @value = value[1]
    @visible = true
  end

  def display
    self.is_facing_up? ? [suit[:symbol], rank_key].join('') : '--'
  end

  def toggle_visibility
    @visible = !@visible
  end

  def is_facing_up?
    @visible
  end

  def color
    suit[:color]
  end
end