# require_relative './utilities.rb'


# __________SPEAKING MODULE__________

module 

class Speech < Hash
    def intialize
    end
end

speech = Speech.new

speech[:words] = 'Hello, there!'

puts speech

# What do I want the Speech class to do?

# It should be a collection of data.
    # The words spoken.
    # Various properties of the words. Friendliness, formality, whatever.

