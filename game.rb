require_relative "deck"
require_relative "game/foundation"
require_relative "game/tableau"
require_relative "game/stock"

class Game
    def initialize
        @foundation = Foundation.new
        
        @deck = Deck.new
        @deck.shuffle
    end

    def deal
        @tableau = Tableau.new(@deck)
        @stock = Stock.new(@deck)
    end

    private
end