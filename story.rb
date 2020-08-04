require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'commands'
require_relative 'game'
require_relative 'movement'

# p $tavern.id
# p $town_square.id

# p $tavern.accessible_locations
# p $town_square.accessible_locations

# Location::ARRAY_OF_LOCATIONS.each do |loc|
#     p loc
#     empty_line(2)
# end

# $hero.where_am_i
# $hero.change_location(:town_square)
# $hero.where_am_i
# $hero.change_location(:tavern)
# $hero.where_am_i

# p get_location_target

p Command.array_of_possible_commands

# Command.array_of_possible_commands = ["hey"]

# Command.array_of_possible_commands.push("what's up?")

p Command.array_of_possible_commands

while $game.active
    "What will our hero do next?".type
    process_input(gets.chomp)
end
