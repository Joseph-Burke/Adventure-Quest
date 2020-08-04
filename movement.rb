require_relative 'characters'

module Moving
    def change_location(new_location)

        new_location = get_target


        if self.location.accessible_locations.include?(new_location)
            self.location = Location::ARRAY_OF_LOCATIONS.detect {|location| location.id == new_location}
        end
    end
end