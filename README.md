# Adventure-Quest

A repository for a "Choose Your Own Adventure" game you can play in the Command Line.

## Progress Log

> This section of the README.md will serve as a record of my thoughts and intentions as I work through the initial parts of the project. This way the viewer will be able to better understand the choices I am making and my hopes for the project.

## List of Tasks

1. A major refactor is required, to look at the work that I've done and see what improvements can be made to the existing structure ofn the project.

2. Create another adjacent location and give the player the ability to move between them.

3. Perhaps a reusable 'soliloquoy'/muttering/wondering/thinking activity should be available to the hero.

## Character Speech

Every character will have, for example, a #greet method.
This method will look at the character's attributes, look into the list of
possible greetings and choose one at random from the range appropriate.

1.  Both items of speech and characters need to have values associated with
    them that will be compared to find what speech objects are appropriate for
    each character.

        i)  I'll start with a #greet method for the character class. It will select a
            greeting from an array of possible greetings and print it to the terminal.

        ii) The character class will have a friendliness value and so will all the possible
            greetings. Some kind of comparison will take place between the two values to
            determine how likely it is that the character would say that.

2.  Later, other factors will be considered, such as the speaker's relationship to the audience,
    gender/sexuality, age, familiarity. These can all be combined into a single 5/6-digit value
    that represents the character of the individual and the character of the speech and therefore 
    the likelihood that this character would say that.

3.  While this all works fine for standard pieces of speech such as greeting, saying farewell,
    thanking, warning, etc., there will also be times when more scripted interactions will be 
    required, such as delivering quests or conveying intrigue.

## Locations

Locations will also be an important aspect of the game. It's important to have the ability to observe one's surroundings.

The player should certainly always have the ability to "look around" and receive a description of the people and objects around
with which the player may interact. Therefore, instances of a Location class can be created, storing all the information about
the location where the player currently is.

Each Location instance should have a list of characters present. Presuming that these characters can only be in one place at 
a time, the characters could themselves have a "location" property which holds information about where the character presently is.
Would it be possible for these two values to interact, allowing a change in a character's location to be reflected in the 'character list' of the location.

## Dialogue

While the #greets method is a good template for how the characters can say certain things pseudo-randomly, it will also be necessary to create more unique dialogue. Each dialogue will most likely belong to a speaker, and will be a conversation "tree", allowing for input from the player to influence the course of the conversation. 

## Quests

Another element to introduce is quests/tasks. The protagonist should be able to acquire quests and review active quests.

## Inventory

With the introduction of quests and rewards, it may be necessary to give the protagonist an inventory to story various items.