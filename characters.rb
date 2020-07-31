require_relative './language.rb'
require_relative './utilities.rb'

class Character
    attr_accessor :name, :age
    include Speaking
    def initialize(name, age)
        @name = name
        @age = age
    end

end

joe = Character.new("Joe Burke", 23)

joe.say_hello
