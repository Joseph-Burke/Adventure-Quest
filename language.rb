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

# test_speech.say
# puts test_speech.friendliness
# p test_speech

module Speaking
    def say_hello
        print "hello"
    end
end



Greeting.new("Greetings.", 0.4)
Greeting.new("Hello.", 0.3)
Greeting.new("How do you do?", 0.5)
Greeting.new("Howdy!", 0.6)
Greeting.new("What's up?!", 0.5)
Greeting.new("Hail!", 0.5)
Greeting.new("Hello, friend.", 0.8)
Greeting.new("Hello, stranger.", 0.4)
Greeting.new("Hi!", 0.6)
Greeting.new("Hey!", 0.6)
Greeting.new("How goes it?", 0.7)

Greeting::POSSIBLE_GREETINGS_ARRAY[rand(Greeting::POSSIBLE_GREETINGS_ARRAY.length)].say


