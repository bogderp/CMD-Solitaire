require_relative "game"

game = Game.new
game.deal
game.render

while user_input = gets.chomp
  system "clear"

  if game.standard_input.include?(user_input)
    game.update(user_input)
    game.render
  else
    game.render_move_selection
  end
end
