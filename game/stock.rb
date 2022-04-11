class Game
  class Stock
    def initialize(deck)
      @stock = deck.deal_remainder
      @talon = []
    end

    def display
      "| #{display_talon} |         | #{display_stock} |"
    end

    private

    def display_talon
      @talon.empty? ? "--" : @talon.last.display
    end

    def display_stock
      @stock.empty? ? "--" : format('%02d', @stock.length)
    end
  end
end