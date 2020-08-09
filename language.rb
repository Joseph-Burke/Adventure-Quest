require_relative './utilities.rb'

# __________SPEECH SUPERCLASS__________
class Speech
    attr_accessor :words_spoken, :friendliness
    def initialize(*args)
        @words_spoken = args[0]
        @friendliness = args[1]
    end

    def say(speed="medium")
        @words_spoken.type(speed)
    end
end

# __________GREETING SUBCLASS__________
class Greeting < Speech
    def initialize(*args)
        super
        @@possible_greetings_array.push(self)
    end

    @@possible_greetings_array = []

    def self.possible_greetings_array=(arg)
        @@possible_greetings_array = arg
    end

    def self.possible_greetings_array
        @@possible_greetings_array
    end
end

# __________Narrative SUBCLASS__________
class Narrative < Speech
    attr_accessor :words_spoken
    def initialize(id, words_spoken)
        @words_spoken = words_spoken
        @@possible_narratives_hash[id] = self
    end

    @@possible_narratives_hash = {}

    # Again, this is the only way I have been able to make the class attribute "possible narratives hash" accessible. 
    # How to make it work with an attr_accessor?
    # Annoying.
    def Narrative.possible_narratives_hash
        @@possible_narratives_hash
    end

    def Narrative.possible_narratives_hash=(arg)
        @@possible_narratives_hash = arg
    end

end

# __________SPEAKING MODULE__________
module Speaking
    def greets
        greeting = nil
        arr = Greeting.possible_greetings_array
        while greeting.nil?
            possible_greeting = arr[rand(arr.length)]
            difference = (self.friendliness - possible_greeting.friendliness).round(1).abs
            next if difference > 0.2
            case difference
            when 0.0
                (greeting = possible_greeting) if roll_dice(3)
            when 0.1
                (greeting = possible_greeting) if roll_dice(2)
            when 0.2
                (greeting = possible_greeting) if roll_dice(1)
            end
        end
        says(greeting)
    end

    def says(speech_object, speed="medium")
        empty_line
        puts (name + " says:")
        empty_line
        speech_object.words_spoken.type(speed)
        empty_line
        wait(1)
    end

    def introduce_self(*args)
        intro_phrase = "My name is "
        introduction = Speech.new(intro_phrase + self.name + ".")
        says(introduction)
        self.known = true
    end
end

# __________NARRATING MODULE__________

module Narrating
    def narrate(narrative, speed="medium")
        empty_line
        narrative.words_spoken.type(speed)
        empty_line
        wait(1)
    end
end

# __________GREETINGS INSTANCES__________
Greeting.new("Greetings.", 0.4)
Greeting.new("Hello.", 0.4)
Greeting.new("How do you do?", 0.5)
Greeting.new("Howdy!", 0.6)
Greeting.new("What's up?!", 0.5)
Greeting.new("Hail!", 0.5)
Greeting.new("Hello, friend.", 0.8)
Greeting.new("Hello, stranger.", 0.4)
Greeting.new("Hi!", 0.6)
Greeting.new("Hey!", 0.6)
Greeting.new("How goes it?", 0.7)
Greeting.new("What do you want?", 0.3)
Greeting.new("What are you looking at?", 0.2)

# __________NARRATIVE INSTANCES__________
Narrative.new(:introduce_story, "Somewhere between two consecutive thoughts, our hero forgets exactly where they are, who they are, and what exactly they are meant to be doing.\nAfter a second, our hero thinks to themself, \"at least I can always type 'what can I do?\" to receive a list of my possible actions.")