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


def process_input(input)
    array = Command::ARRAY_OF_POSSIBLE_COMMANDS
    array.each do |i|
        if i.input.downcase == input.downcase
            i.output.call
            break
        end
    end
end
