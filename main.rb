require './language.rb'

module TypeTextSlowly
    def type(speed='medium')
        case speed
        when 'slow'
            speed_multiplier = 0.3
        when 'medium'
            speed_multiplier = 0.2
        when 'quick'
            speed_multiplier = 0.1
        end
        arr = self.split('')
        arr.each {|letter| print letter; sleep speed_multiplier * rand(0.25) }
        print "\n"
    end
end

class String
    include TypeTextSlowly
end

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

def wait(length_of_pause='medium')
    case length_of_pause
    when 'short'
        length_of_pause = 1
    when 'medium'
        length_of_pause = 2
    when 'long'
        length_of_pause = 3
    end
    sleep(length_of_pause)
end


# barman = Character.new("Jonathon Gillingham", 48)

# barman.greet("Joe")
# barman.greet(barman.name)




# string = "This is a test string"

# string.type('quick')
# wait('short')
# string.type
# wait
# string.type('slow')
# wait('long')

