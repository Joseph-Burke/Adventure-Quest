require_relative 'utilities'
require_relative 'characters'
require_relative 'locations'
require_relative 'commands'

class Game
    attr_accessor :active
    def initialize
        @active = true
    end

    def end_game
        @active = false
    end
end

$game = Game.new
