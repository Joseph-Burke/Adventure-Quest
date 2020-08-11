module Typable
    def type(speed='medium')
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

class String
    include Typable
end

class Speech < Hash
    include Typable
    def initialize
    end
end

class Character
    include Typable
    attr_accessor :name, :age, :friendliness, :location, :appearance, :activity, :known

    def initialize
    end

    def says(something)
        something.type if something.is_a?(String)
        something[:words].type if something.is_a?(Speech)
    end

end


char = Character.new
speech = Speech.new
speech[:words] = "World"

puts char.says("Hello")
puts char.says(speech)