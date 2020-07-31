require_relative './language.rb'
require_relative './utilities.rb'

class Character
    attr_accessor :name, :age, :friendliness
    include Speaking
    def initialize(name, age, friendliness)
        @name = name
        @age = age
        @friendliness = friendliness
    end

end

joe = Character.new("Joe Burke", 23, 0.5)

# joe.greet
