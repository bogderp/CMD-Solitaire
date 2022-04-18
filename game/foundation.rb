class Game
  class Foundation
    def initialize
      @piles = Array.new(4) { Pile.new([], true) }
    end

    def display
      [display_by_position(0), 
       display_by_position(1), 
       display_by_position(2), 
       display_by_position(3)].join(' | ').strip
    end

    private

    def display_by_position(position)
        card = @piles[position]&.last
        return "--" if card.nil?

        card.display
    end
  end
end