require_relative './language.rb'
require_relative './utilities.rb'

class Character
    attr_accessor :name, :age, :friendliness
    include Speaking
    include Laughing
    def initialize(name, age, friendliness)
        @name = name
        @age = age
        @friendliness = friendliness
    end
end

class Protagonist < Character
    def initialize(name, age, friendliness)
        super
    end
end


