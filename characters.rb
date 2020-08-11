require_relative 'utilities'
# require_relative 'locations'
# require_relative 'commands'
# require_relative 'game'
require_relative 'language'
# require_relative 'movement'

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

# A CHARACTER WILL #SPEAK A Speech OBJECT.

# SHOULD CHARACTERS ALSO BE ABLE TO #SPEAK STRINGS? MIGHT AS WELL.

char = Character.new
speech = Speech.new
speech[:words] = "World"

puts char.says("Hello")
puts char.says(speech)
