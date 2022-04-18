require_relative "deck"
require_relative "game/pile"
require_relative "game/foundation"
require_relative "game/tableau"
require_relative "game/stock"

class Game
  # Tableau
  # Foundation
  # Stock
  # Talon
  #

  def initialize
    @foundation = Foundation.new

    @deck = Deck.new
    @deck.shuffle
  end

  def deal
    @tableau = Tableau.new(@deck)
    @stock = Stock.new(@deck)
  end

  def update(input)
    case input
    when 'd', 'D'
      @stock.draw
    when 'n', 'N'
      @deck = Deck.new
      @deck.shuffle
      deal
    when 'q', 'Q'
      puts "Thanks for playing!"
      exit(0)
    end
  end

  def render
    render_foundation_and_stock
    render_tableau
    render_move_selection
  end

  def standard_input
    %w[D Q N d q n]
  end

  def render_move_selection
    puts "\nValid Moves"
    puts "1: ----"
    puts "2: ----"
    puts "3: ----"
    puts "D: Draw"
    puts "N: New Game"
    puts "Q: Quit"
    puts "Select a move: "
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