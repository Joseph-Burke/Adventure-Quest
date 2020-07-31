require_relative './utilities.rb'
require_relative './characters.rb'

joe = Protagonist.new("Joe", 23, 0.5)
brandon = Character.new("Brandon", 35, 0.2)
oyeleke = Character.new("Oyeleke", 26, 0.8)

joe.greets
brandon.greets
oyeleke.greets