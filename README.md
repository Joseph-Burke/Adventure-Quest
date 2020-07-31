# Adventure-Quest
A repository for a "Choose Your Own Adventure" game you can play in the Command Line.

## Progress Log
> This section of the README.md will serve as a record of my thoughts and intentions as I work through the initial parts of the project. This way the viewer will be able to better understand the choices I am making and my hopes for the project.

## List of Tasks

1. Create a Character class in characters.rb

2. Create a Speaking module in language.rb and include it in the Character class.

3. Create a Speech class for items of speech. 

4. Create a universally accessible $array_of_possible_greetings in the Speaking module and fill it with Speech objects

## Character Speech

Every character will have, for example, a #greet method.
This  method will look at the character's attributes, look into the list of
possible greetings and choose one at random from the range appropriate.

1. Both items of speech and characters need to have values associated with
them that will be compared to find what speech objects are appropriate for 
each character. 

    i)  I'll start with a #greet method for the character class. It will select a 
        greeting from an array of possible greetings and print it to the terminal.

    ii) The character class will have a friendliness value and so will all the possible
        greetings. Some kind of comparison will take place between the two values to
        determine how likely it is that the character would say that.

