require_relative "deck"
require_relative "game/pile"
require_relative "game/foundation"
require_relative "game/tableau"
require_relative "game/stock"
require 'pry'

class Game
  # Tableau
  # Foundation
  # Stock
  # Talon

  def initialize
    @valid_moves = {}
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
    puts <<~HEREDOC
      \nValid Moves
      #{generate_valid_moves.join("\n")}
      D: Draw
      N: New Game
      Q: Quit
      Select a move:
    HEREDOC
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

  def generate_valid_moves
    moves = [
      @foundation.moves(@stock.current_card, @tableau.top_cards),
      @tableau.moves(@stock.current_card, @foundation.top_cards)
    ].flatten

    moves.sort! do |a, b|
      [a[:from][:location], a[:to][:card], a[:to][:location]] <=> [b[:from][:location], b[:to][:card], b[:to][:location]]
    end

    @valid_moves.clear
    moves.map.with_index do |move, index|
      @valid_moves[index] = move
      "#{index}: #{move[:from][:location]} #{move[:from][:card]} to #{move[:to][:location]} #{move[:to][:card]}"
    end
  end
end