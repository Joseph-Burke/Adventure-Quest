require_relative './utilities.rb'
require_relative './characters.rb'
require_relative './locations.rb'

tavern = Location.new("The Lionheart Tavern")

joe = Protagonist.new("Joe", 23, 0.5, tavern)
brandon = Character.new("Brandon", 35, 0.2, tavern)
oyeleke = Character.new("Oyeleke", 26, 0.8, tavern)
amita = Character.new("Amita", 25, 0.7, tavern)

joe.who_is_here


joe.greets
brandon.greets
oyeleke.greets
amita.greets