class Game
    attr_accessor :game_active
    def initialize
        @game_active = true
    end

    def end_game
        @game_active = false
    end
end
