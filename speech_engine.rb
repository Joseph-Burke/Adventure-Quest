#!/usr/bin/env ruby

speech = 'Hello'

def wait(length_of_pause = 'medium')
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

class String
  def type_out(speed = 'medium')
    case speed
    when 'slow' || 3
      speed_multiplier = 0.3
    when 'medium' || 2
      speed_multiplier = 0.2
    when 'quick' || 1
      speed_multiplier = 0.1
    end
    arr = self.split('')
    arr.each { |letter| print letter; sleep speed_multiplier * rand(0.25) }
    print "\n"
  end
end

class Person
  attr_accessor :properties
  def initialize(*args)
    @properties = args[0]
  end

  def says(speech)
    speech.words.type_out if speech.is_a?(Speech)
    speech.type_out if speech.is_a?(String)
  end

  def greet
    arr = Greeting::ALL_GREETINGS
    chosen_greeting = nil
    until chosen_greeting
      possible_greeting = arr[rand(arr.length)]
      chosen_greeting = possible_greeting if possible_greeting.properties[:friendliness] == self.properties[:friendliness]
    end

    says(chosen_greeting) if chosen_greeting.properties[:friendliness]
    p chosen_greeting.properties
  end

end

class Speech
  attr_accessor :words, :properties
  def initialize(*args)
    @words = args[0]
    @properties = args[1]
    Speech::ALL_SPEECHES.push(self)
  end

  def to_s
    @words
  end

  Speech::ALL_SPEECHES = []
end

class Greeting < Speech
  attr_accessor :words, :properties
  def initialize(*args)
    super
    Greeting::ALL_GREETINGS.push(self)
  end

  Greeting::ALL_GREETINGS = []
end

# GENERATE 11**2 GREETINGS OF ALL FRIENDLINESS AND FORMALITY COMBINATIONS 
(0).upto(10) do |i|
  friendliness = i.to_f / 10
  (0).upto(10) do |j|
    formality = j.to_f / 10
    Greeting.new(
      "Hello. Friendliness: #{friendliness}. Formality: #{formality}.",
      {
        :friendliness => friendliness,
        :formality => formality,
    }
    )
  end
end

# TEST CHAR.GREET
char = Person.new({
  :friendliness => 0.5,
  :formality => 0.5
})

char.greet



# Greeting::ALL_GREETINGS.each { |greeting| char.says(greeting) }

# Greeting.new('Hello.',{:friendliness => 0})
# Greeting.new("Hello.",{:friendliness => 0.1})
# Greeting.new("Hello.",{:friendliness => 0.2})
# Greeting.new("Hello.",{:friendliness => 0.3})
# Greeting.new("Hello.",{:friendliness => 0.4})
# Greeting.new("Hello.",{:friendliness => 0.5})
# Greeting.new('Hello.',{:friendliness => 0.6})
# Greeting.new('Hello.',{:friendliness => 0.7})
# Greeting.new('Hello.',{:friendliness => 0.8})
# Greeting.new('Hello.',{:friendliness => 0.9})
# Greeting.new('Hello.',{:friendliness => 1})

# person.says(Greeting::ALL_GREETINGS[0])
