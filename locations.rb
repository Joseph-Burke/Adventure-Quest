require_relative 'utilities'
require_relative 'characters'
require_relative 'commands'
require_relative 'game'

class Location
    attr_accessor :name, :description, :characters_present, :accessible_locations, :id
    def initialize(*args)
        @id = args[0]
        @name = args[1]
        @description = args[2]
        @accessible_locations = []
        @characters_present = []

        @@array_of_locations.push(self)
        
        HASH_OF_ACCESS.each do |key, value| 
            if key == @id
                @accessible_locations = value
            end
        end
    end

    HASH_OF_ACCESS = {
        :tavern => [:town_square],
        :town_square => [:tavern]
    }

    @@array_of_locations = []

    def self.array_of_locations
        @@array_of_locations
    end

     def self.array_of_locations=(arg)
        @@array_of_locations = arg
    end

end

$tavern = Location.new(
    :tavern,
    "The Lionheart Tavern", 
    "The Lionheart Tavern is cosy, safe and familiar. Blistered logs are crackling in the hearth, the sounds of merry conversations blend into each other, and just now as our hero looks around, a flagon of mead is being pulled at the bar. Looks good.",
    )

$town_square = Location.new(
    :town_square,
    "Littleton Town Square",
    "Littleton's town square is surrounded by pretty but modest buildings of various kinds, including a tavern and a church. In the middle is a gently trickling fountain, and pigeons are all around, squawking and squabbling over crumbs on the cobblestones.",
)
