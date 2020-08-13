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

class Speech < String
    def initialize(string)
        @properties = Hash.new
        # take_properties_from(input_hash)
    end

    def take_properties_from(hash)
        hash.each { |key, value| @properties[key] = value}
    end

end

class Character
    attr_accessor :name, :age, :friendliness, :location, :appearance, :activity, :known
    def initialize
    end

    def says(arg)
        arg.type
    end

end

char = Character.new
speech = Speech.new(
        "Hello!"
        {
        :friendliness => 0.5,
        :formality => 0.6
    }
)

char.says(speech)

puts speech

