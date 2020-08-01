require_relative 'utilities'
require_relative 'characters'
require_relative 'commands'
require_relative 'game'

class Location
    attr_accessor :name, :description, :characters_present
    def initialize(*args)
        @name = args[0]
        @description = args[1]
        @characters_present = []
    end
end

$tavern = Location.new(
    "The Lionheart Tavern", 
    "The Lionheart Tavern is cosy, safe and familiar. Blistered logs are crackling in the hearth, the sounds of merry conversations blend into each other, and just now as our hero looks around, a flagon of mead is being pulled at the bar. Looks good."
    )
