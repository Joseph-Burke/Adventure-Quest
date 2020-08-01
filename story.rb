require_relative './utilities.rb'
require_relative './characters.rb'
require_relative './locations.rb'

tavern = Location.new(
    "The Lionheart Tavern", 
    "The Lionheart Tavern is cosy, safe and familiar. Blistered logs are crackling in the hearth, the sounds of merry conversations blend into each other, and just now as our hero looks around, a flagon of mead is being pulled at the bar. Looks good."
    )

joe = Protagonist.new("Joe", 23, 0.5, tavern, "adventuring, as always.")
brandon = Character.new("Brandon", 35, 0.2, tavern, "sitting by the fire, staring wistfully into the flames.")
oyeleke = Character.new("Oyeleke", 26, 0.8, tavern, "playing cards with Amita. He seems to be losing.")
amita = Character.new("Amita", 25, 0.7, tavern, "playing cards with Oyeleke. She seems to be winning.")

# joe.who_is_here
# joe.where_am_i
joe.what_are_they_doing(brandon, oyeleke, joe, amita)

# amita.greets
# brandon.greets
# oyeleke.greets