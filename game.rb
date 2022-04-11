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

  def render
    render_foundation_and_stock
    render_tableau
  end

  private

  def render_foundation_and_stock
    puts "Foundation              Talon           Stock"
    puts "---------------------   ---------------------"
    puts "| #{@foundation.display} |   #{@stock.display}"
    puts "---------------------   ---------------------"
  end

  def render_tableau
    puts "\nTableau"
    puts "---------------------"
    @tableau.display
    puts "---------------------"
  end
end