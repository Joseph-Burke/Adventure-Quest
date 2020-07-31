class Speech
    attr_accessor :words_spoken
    def initialize(speaker, audience, words_spoken)
        @speaker = speaker
        @audience = audience
        @words_spoken = words_spoken
    end

    def utter
        @words_spoken.type
    end
end

class Greeting < Speech
    def initialize(speaker, audience, words_spoken)
        super
    end
end

module Speaking
    def say_hello
        print "hello"
    end
end

