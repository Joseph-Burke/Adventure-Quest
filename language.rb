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