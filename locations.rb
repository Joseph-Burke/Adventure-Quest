require_relative './utilities.rb'
require_relative './characters.rb'

class Location
    attr_accessor :name, :description, :characters_present
    def initialize(*args)
        @name = args[0]
        @description = args[1]
        @characters_present = []
    end
end
