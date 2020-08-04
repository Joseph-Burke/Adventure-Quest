require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'game'

class Command
    attr_accessor :input, :output
    def initialize(*args)
        @input = args[0]
        @output = args[1]
        ARRAY_OF_POSSIBLE_COMMANDS.push(self)
    end

    ARRAY_OF_POSSIBLE_COMMANDS = []
end

Command.new("quit game", -> {$game.end_game})
Command.new("greet", -> {$hero.greets})
Command.new("what can I do?", -> {$hero.what_can_i_do})
Command.new("who is here?", -> {$hero.who_is_here})
Command.new("where am I?", -> {$hero.where_am_i})
Command.new("approach", -> {$hero.approach})
Command.new("introduce myself", -> {$hero.make_introductions})

def get_target
    arr_of_options = $hero.location.characters_present.select {|char| char unless char.is_a?(Protagonist)}
    arr_of_options = arr_of_options.map {|char| char.name }
    "Select your target:".type
    arr_of_options.display_options
    target = gets.chomp.downcase
    Character::ARRAY_OF_ALL_CHARACTERS.each {|char| return char if target == char.name.downcase}
end

def get_location_target
    # Procure an array of symbols that represent the locations that are accessible from the hero's location.
    arr_of_options = $hero.location.accessible_locations.select {|location| location unless location == $hero.location}
    # From that array, get an array of the actual Location objects.
        # For each 
    arr_of_locations = []
    arr_of_options.length do |option|
        print option
    end

    # Run display_options on an array of the names of the possible Locations.

    # Compare the input to the names displayed and return the location whose name matches the input

end



def process_input(input)
    array = Command::ARRAY_OF_POSSIBLE_COMMANDS
    array.each do |i|
        if i.input.downcase == input.downcase
            i.output.call
            break
        end
    end
end
