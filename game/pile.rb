class Game
  class Pile < Array
    def initialize(cards = [], is_foundation = false)
      super(cards)
      @is_foundation = is_foundation
    end

    def can_receive?(card)
      return false if card.nil?

      if self.empty? && @is_foundation
        card.value == Constants::RANKS[:ACE][1]
      elsif self.empty?
        card.value == Constants::RANKS[:KING][1]
      elsif @is_foundation
        self.last.value - 1 == card.value && self.last.symbol == card.symbol
      else
        self.last.value + 1 == card.value && self.last.color != card.color
      end
    end
  end
end