require_relative 'utilities'
require_relative 'locations'
require_relative 'commands'
require_relative 'game'
require_relative 'language'

class Character
    attr_accessor :name, :age, :friendliness, :location, :activity
    include Speaking
    include Laughing
    def initialize(*args)
        @name = args[0]
        @age = args[1]
        @friendliness = args[2]
        @location = args[3]
        location.characters_present.push(self) if @location
        @activity = args[4]
        @appearance
        ARRAY_OF_ALL_CHARACTERS.push(self)
    end
    ARRAY_OF_ALL_CHARACTERS = []
end

class Protagonist < Character
    def initialize(*args)
        super
    end

    def who_is_here
        empty_line
        "Our hero takes a look around to see who else is here in #{self.location.name}.".type("quick")
        empty_line
        location.characters_present.each {|char| wait(rand(1..2));(char.name + ", who is " + char.activity).type("quick") unless char == self}
        empty_line; wait(1)
    end

    def where_am_i
        empty_line;"What is this place? - our hero mutters, and takes a look around.".type('quick');empty_line
        wait(2)
        self.location.description.type
        empty_line;wait(2)
    end

    def what_are_they_doing(*args)
        if args.length == 1
            "What is #{args[0].name} doing?".type
        elsif args.length > 1
            list_of_chars = "#{args[0].name}"; args.drop(1).each {|char| list_of_chars.concat(" and " + char.name)}
            "What are #{list_of_chars} doing?".type
            empty_line
            args.each {|char| (char.name + " is " + char.activity).type}
            empty_line
        end
    end

    def what_can_i_do
        "Our hero spends a moment thinking of different things to do, and comes up with the following ideas:".type('quick')
        empty_line
        Command::ARRAY_OF_POSSIBLE_COMMANDS.each {|command| command.input.type('quick')}
        wait(1);empty_line
        "What a good memory our hero has!".type
        empty_line
    end

    def approach
        "Who does our hero approach?".type
        arr = []; $joe.location.characters_present.each {|char| arr.push(char.name) unless char.is_a?(Protagonist)}
        arr.display_options
        target = nil
        input = gets.chomp.downcase
        arr.each {|char| (target = input.capitalize;break) if char.downcase == input }
        "Our hero approaches #{target}, who looks up as our hero nears.".type
        ARRAY_OF_ALL_CHARACTERS.each {|char| target = char if char.name == target}
        self.greets
        target.greets
    end
end

class Narrator < Character
    include Narrating
end

$joe = Protagonist.new("Joe", 23, 0.5, $tavern, "adventuring, as always.")
$brandon = Character.new("Brandon", 35, 0.2, $tavern, "sitting by the fire, staring wistfully into the flames.")
$oyeleke = Character.new("Oyeleke", 26, 0.8, $tavern, "playing cards with Amita. He seems to be losing.")
$amita = Character.new("Amita", 25, 0.7, $tavern, "playing cards with Oyeleke. She seems to be winning.")
$narrator = Narrator.new