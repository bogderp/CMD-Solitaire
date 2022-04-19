class Game
  class Tableau
    def initialize(deck)
      temp = Array.new(7) { Pile.new }
      
      deal_index = 0
      7.times do |i|
        (deal_index..6).each do |pile_index|
          card = deck.pop
          card.toggle_visibility if pile_index != deal_index
          temp[pile_index] << card
        end
        deal_index += 1
      end
    
      @piles = temp
    end

    def display
      (1..display_height).each do |row|
        row = @piles.map do |pile|
          pile.count >= row ? pile[row - 1].display : "  "
        end
        puts row.join(' ')
      end
    end

    def top_cards
      @piles.map(&:last)
    end

    private

    def display_height
      @piles.map(&:count).max
    end
  end
end