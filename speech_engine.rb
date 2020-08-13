#!/usr/bin/env ruby

speech = 'Hello'

def wait(length_of_pause='medium')
    case length_of_pause
    when 'short' || 1
        length_of_pause = 1
    when 'medium' || 2
        length_of_pause = 2
    when 'long' || 3
        length_of_pause = 3
    end
    sleep(length_of_pause)
end

class String
    def type_out(speed='medium')
        case speed
        when 'slow' || 3
            speed_multiplier = 0.3
        when 'medium' || 2
            speed_multiplier = 0.2
        when 'quick' || 1
            speed_multiplier = 0.1
        end
        arr = self.split('')
        arr.each {|letter| print letter; sleep speed_multiplier * rand(0.25) }
        print "\n"
    end
end

class Person 
    def initialize
    end

    def says(string)
        string.type_out
    end
end

class Speech < String
    def initialize(string)
        super
    end
end

speech = Speech.new("hello")
person = Person.new

person.says(speech)
