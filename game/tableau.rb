class Game
  class Tableau
    def initialize(deck)
      temp = Array.new(7) { Pile.new }
      
      deal_index = 0
      7.times do |i|
        (deal_index..6).each do |pile_index|
          temp[pile_index] << deck.pop
        end
        deal_index += 1
      end
    
      @piles = temp
    end

    def display
      height = display_height
      (1..height).reverse_each do |h|
        row = @piles.each_with_object([]) do |pile, arr|
          if h == 1
            arr << pile.last.display
          else
            arr << (pile.count >= h ? "--" : "  ")
          end
        end
        puts row.join(' ')
      end
    end

    private

    def display_height
      @piles.map(&:count).max
    end
  end
end