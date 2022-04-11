class Game
  class Tableau
    def initialize(deck)
      temp = Array.new(7) { [] }
      
      deal_index = 0
      7.times do |i|
        (deal_index..6).each do |pile_index|
          temp[pile_index] << deck.pop
        end
        deal_index += 1
      end
    
      @piles = temp
    end

    private
  end
end