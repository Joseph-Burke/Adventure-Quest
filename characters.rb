require './language.rb'
require './utilities.rb'


class Character
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end

    def greet(person, friendliness="neutral")

        case friendliness
        when "friendly"
            greeting_question = "To what do I owe this pleasure, friend?"
        when "neutral"
            greeting_question = "Can I help you with something?"
        when "unfriendly"
            greeting_question = "What do you want?"
        end
        "Hello, #{person}. #{greeting_question}".type
    end
end

joe = Character.new("Joe Burke", 23)
