require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'commands'
require_relative 'game'

commands = Command::ARRAY_OF_POSSIBLE_COMMANDS

# Create an input cycle

# $narrator.narrate(Narrative::POSSIBLE_NARRATIVES_HASH[:introduce_story])

$hero.who_is_here

$hero.introduce_self
$maiden.introduce_self
$jester.introduce_self
$sellsword.introduce_self

$hero.who_is_here

# while $game.active
#     "What will our hero do next?".type
#     process_input(gets.chomp)
# end
