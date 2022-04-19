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

    def moves(talon_card, tableau_cards)
      @piles.each_with_object([]).with_index do |(pile, moves), index|
        if pile.can_receive?(talon_card)
          moves << {
            from: talon_card.display,
            from_index: nil,
            from_location: 'Talon',
            to: pile.empty? ? "Pile #{index + 1}" : pile.last.display,
            to_index: index,
            to_location: 'Foundation'
          }
        end

        tableau_cards.each_with_index do |tableau_card, tableau_index|
          if pile.can_receive?(tableau_card)
            moves << {
              from: tableau_card.display,
              from_index: tableau_index,
              from_location: 'Tableau',
              to: pile.empty? ? "Pile #{index + 1}" : pile.last.display,
              to_index: index,
              to_location: 'Foundation'
            }
          end
        end
      end
    end

    def top_cards
      @piles.map(&:last)
    end

    private

    def display_by_position(position)
        card = @piles[position]&.last
        return "--" if card.nil?

        card.display
    end
  end
end