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
  def initialize
  end

  def says(speech)
    speech.words.type_out if speech.is_a?(Speech)
    speech.type_out if speech.is_a?(String)
  end
end

class Speech
  attr_accessor :words
  def initialize(*args)
    @words = args[0]
    @properties = args[1]
  end
end

speech = Speech.new(
  'hello',
  {
    :friendliness => 0.5,
    :formality => 0.5
  }
)
person = Person.new

person.says(speech)
