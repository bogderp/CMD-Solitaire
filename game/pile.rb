class Game
  class Pile < Array
    def initialize(cards = [], is_foundation = false)
      super(cards)
      @is_foundation = is_foundation
    end
  end
end