# Sky Zoo Datapack

Sky Zoo is a set of additional advancements based on capturing hostile mobs in Minecraft Java Edition 1.15.1+. It's
designed to be played on a skyblock map either in single player or together with friends. Currently, the datapack is
designed to to played on DrTrog's Skyblock 4 map but it can played on any map (doesn't even need to be a skyblock
map). You can downlaod the recommended skyblock map from here:

https://www.planetminecraft.com/project/skyblock-4/

We are currently targeting version 4.07.1 of this map.

Sky Zoo also features a Zookeeper (wandering trader) that has various special trades which are all locked at the start
of the game. As you capture mobs, these trades are unlocked for you to use as a reward. When you capture a mob, you will
also be given one set of items for free.

You can review which mobs need to be captured by viewing the Zookeeper's trades or by looking at the Sky Zoo advancements
tab where all the mobs are listed together with the reward you get for capturing them.

To capture a mob, simply enclose them somewhere and then name them with a name tag as `Captured` (exactly with matching case).

The tab screen tracks player deaths which you can use as an extra challenge. Try completing the map with less than 10 deaths
across all players. This is optional, the datapack doesn't enforce limited lives.

Once all the mobs have been caught and you have finished your zoo, the map is complete and you'll see a congratulations message.

## How to change the mob capture list and their rewards

1. Edit `mobs.csv` to add new mobs, change existing trades or remove mobs from the capture list.
2. Regenerate Minecraft functions, advancements and zip the pack up with `ruby .\generate.rb`.
3. Copy `./build/sky-zoo.zip` and place in the `datapacks` folder your Minecraft world.
4. Run `/reload` and then `/function sky_zoo:setup` which will summon the Zookeeper where you are standing and give you an instructions book and first name tag.

## TODO

* Review rewards and costs for new map (other rewards rather than trades? A book to skip day? Control the weather? etc)

## Development Requirements

* Install Ruby 2.6+
* Install the Rubyzip gem with `gem install rubyzip`
