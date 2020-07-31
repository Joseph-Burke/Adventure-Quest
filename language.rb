require_relative './utilities.rb'
# __________SPEECH SUPERCLASS__________
class Speech
    attr_accessor :words_spoken, :friendliness
    include Utilities
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
        POSSIBLE_GREETINGS_ARRAY.push(self)
    end
    POSSIBLE_GREETINGS_ARRAY = []
end
# __________LAUGHTER SUBCLASS__________
class Laughter < Speech
    def initialize(*args)
        super
        POSSIBLE_LAUGHS_ARRAY.push(self)
    end
    POSSIBLE_LAUGHS_ARRAY = []
end

# __________SPEAKING MODULE__________
module Speaking
    def greets
        greeting = nil
        arr = Greeting::POSSIBLE_GREETINGS_ARRAY
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
        puts name + " says:"
        empty_line
        speech_object.words_spoken.type(speed)
        empty_line
        wait(1)
    end
end
# __________LAUGHING MODULE__________
module Laughing
    def laughs
        puts
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

# __________LAUGHTER INSTANCES__________
Laughter.new("What?", 0.1)
Laughter.new("Har, har. Well aren't you funny...", 0.2)
Laughter.new("Ha! That's a good one, I'll give you that.", 0.4)
Laughter.new("He, he, he, nice one.", 0.5)
Laughter.new("Hee-hee!", 0.6)
Laughter.new("Ha, ha, ha. Very good.", 0.6)
Laughter.new("Ha, ha, ha!", 0.6)
Laughter.new("Ho, Ho, Ho!! Splendid, simply splendid!", 0.8)
Laughter.new("Aaaaahahahaha!", 1)


