module TypeTextSlowly
    def type_slow
        arr = self.split('')
        arr.each {|letter| print letter; sleep 0.2 * rand(0.25) }
        print "\n"
    end
end

class String
    include TypeTextSlowly
end

"Welcome Adventurer!".type_slow