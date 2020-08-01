require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'commands'
require_relative 'game'

commands = Command::ARRAY_OF_POSSIBLE_COMMANDS

# Create an input cycle
while $game.active
    "What will our hero do next?".type
    process_input(gets.chomp)
end

