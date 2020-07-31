require_relative './language.rb'
require_relative './utilities.rb'

class Character
    attr_accessor :name, :age, :friendliness, :location
    include Speaking
    include Laughing
    def initialize(*args)
        @name = args[0]
        @age = args[1]
        @friendliness = args[2]
        @location = args[3]
        location.characters_present.push(self) if @location 
    end

end

class Protagonist < Character
    def initialize(*args)
        super
    end

    def who_is_here
        empty_line
        "Our hero takes a look around to see who else is here in #{self.location.name}.".type("quick")
        empty_line
        location.characters_present.each {|char| wait(rand(1..2)); puts char.name unless char == self}
        empty_line; wait(1)
    end

    def where_am_i
        empty_line;"What is this place? - our hero mutters, and takes a look around.".type;empty_line
        wait(2)
        self.location.description.type
        empty_line;wait(2)
    end
end


