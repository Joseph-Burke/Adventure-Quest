require_relative './utilities.rb'

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

class Greeting < Speech
    def initialize(*args)
        super
        POSSIBLE_GREETINGS_ARRAY.push(self)
    end
    POSSIBLE_GREETINGS_ARRAY = []
end


module Speaking
    def greet
        greeting_chosen = false
        arr = Greeting::POSSIBLE_GREETINGS_ARRAY
        until greeting_chosen 
            possible_greeting = arr[rand(arr.length)]
            friendliness_difference = (self.friendliness - possible_greeting.friendliness).round(1).abs
            next if friendliness_difference > 0.2
            case friendliness_difference
            # 50% chance of saying that.
            when 0.0
                (possible_greeting.say; greeting_chosen = true) if roll_dice(3)
            # 33% chance of saying that.
            when 0.1
                (possible_greeting.say; greeting_chosen = true) if roll_dice(2)
            # 25% chance of saying that.
            when 0.2
                (possible_greeting.say; greeting_chosen = true) if roll_dice(1)
            end
        end
    end
end

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


