def wait(length_of_pause='medium')
    case length_of_pause
    when 'short'
        length_of_pause = 1
    when 'medium'
        length_of_pause = 2
    when 'long'
        length_of_pause = 3
    end
    sleep(length_of_pause)
end

module Utilities
    def type(speed='medium')
        case speed
        when 'slow'
            speed_multiplier = 0.3
        when 'medium'
            speed_multiplier = 0.2
        when 'quick'
            speed_multiplier = 0.1
        end
        arr = self.split('')
        arr.each {|letter| print letter; sleep speed_multiplier * rand(0.25) }
        print "\n"
    end
end

class String
    include Utilities
end