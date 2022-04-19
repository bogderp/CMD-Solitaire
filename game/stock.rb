class Game
  class Stock
    def initialize(deck)
      @stock = Pile.new(deck.deal_remainder)
      @talon = Pile.new
    end

    def draw
      @stock = @talon.pop(@talon.length) if @stock.empty?
      @talon << @stock.shift
    end

    def display
      "| #{display_talon} |         | #{display_stock} |"
    end

    def current_card
      @talon.last
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