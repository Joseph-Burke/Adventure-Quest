module TypeTextSlowly
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
    include TypeTextSlowly
end

def wait(num_of_seconds)
    sleep num_of_seconds
end



