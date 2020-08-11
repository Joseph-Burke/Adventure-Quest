def wait(length_of_pause='medium')
    case length_of_pause
    when 'short' || 1
        length_of_pause = 1
    when 'medium' || 2
        length_of_pause = 2
    when 'long' || 3
        length_of_pause = 3
    end
    sleep(length_of_pause)
end

def roll_dice(probability)
    case probability
    when 3
        return true if rand(1..6) % 2 == 0 
    when 2
        return true if rand(1..6) % 3 == 0
    when 1
        return true if rand(1..6) % 6 == 0
    end
    false
end

module Typable
    def type(speed='medium')
        case speed
        when 'slow' || 3
            speed_multiplier = 0.3
        when 'medium' || 2
            speed_multiplier = 0.2
        when 'quick' || 1
            speed_multiplier = 0.1
        end
        arr = self.split('')
        arr.each {|letter| print letter; sleep speed_multiplier * rand(0.25) }
        print "\n"
    end
end

def empty_line(num=1)
    num.times {puts}
end

class Array
    def display_options
        gap = " " * 5
        empty_line;self.each {|option| print option.to_s + gap};empty_line(2)
    end
end
