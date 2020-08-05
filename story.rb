require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'commands'
require_relative 'game'
require_relative 'movement'

while $game.active
    "What will our hero do next?".type
    process_input(gets.chomp)
end
