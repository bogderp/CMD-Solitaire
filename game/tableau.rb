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

    def moves(talon_card, foundation_cards)
      @piles.each_with_object([]).with_index do |(pile, moves), pile_index|
        foundation_cards.each_with_index do |foundation_card, foundation_index|
          if pile.can_receive?(talon_card) {
            moves << {
              from: {
                card: talon_card.display,
                index: nil,
                pile_index: nil,
                location: 'Stock',
              },
              to: {
                card: pile.empty? ? "Pile #{index + 1}" : pile.last.display,
                index: index,
                pile_index: nil,
                location: 'Foundation'
              }
            }
          }

          if pile.can_receive?(foundation_card)
            moves << {
              from: {
                card: foundation_card.display,
                index: foundation_index,
                pile_index: nil,
                location: 'Foundation'
              },
              to: {
                card: pile.empty? ? "Column #{pile_index + 1}" : pile.last.display,
                index: pile_index,
                pile_index: nil,
                location: 'Tableau'
              }
            }
          end
        end

        cards_facing_up.each_with_index do |column, column_index|
          next if column_index == pile_index

          column.each do |column_card|
            if pile.can_receive?(column_card[:card])
              moves << {
                from: {
                  card: column_card[:card].display,
                  index: column_index,
                  pile_index: column_card[:index],
                  location: 'Tableau',
                },
                to: {
                  card: pile.empty? ? "Column #{pile_index + 1}" : pile.last.display,
                  index: pile_index,
                  pile_index: nil,
                  location: 'Tableau'
                }
              }
            end
          end
        end
      end
    end

    private

    def display_height
      @piles.map(&:count).max
    end

    def cards_facing_up
      @piles.map(&:cards_facing_up)
    end
  end
end