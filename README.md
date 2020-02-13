# Sky Zoo Datapack

Sky Zoo is a set of additional advancements based on capturing hostile mobs in Minecraft Java Edition 1.15.2+. It's
designed to be played on a skyblock map either in single player or together with friends. Currently, I recommend playing
on DrTrog's Skyblock 4 map but it can played on any map (doesn't even need to be a skyblock map). You can downlaod the
recommended skyblock map from here:

https://www.planetminecraft.com/project/skyblock-4/

Sky Zoo also features a Zookeeper (wandering trader) that has various special trades which are all locked at the start
of the game. As you capture mobs, these trades are unlocked for you to use as a reward. When you capture a mob, you will
also be given one set of items for free. These free items will be dropped at the Zookeeper's feet.

You can review which mobs need to be captured by viewing the Zookeeper's trades or by looking at the Sky Zoo advancements
tab where all the mobs are listed together with the reward you get for capturing them.

To capture a mob, simply enclose them somewhere and then name them with a name tag as `Captured` (exactly with matching case).

The tab screen tracks player deaths which you can use as an extra challenge. Try completing the map with less than 10 deaths
across all players. This is optional, the datapack doesn't enforce limited lives.

Once all the mobs have been caught and you have finished your zoo, the map is complete and you'll see a congratulations message.

## How to install Sky Zoo

1. Download the [datapack zip file](https://github.com/LogicalGeekBoy/sky-zoo/raw/master/build/sky-zoo.zip)
2. Go to your Minecraft world folder and place the datapack zip file inside the `datapacks` folder.
3. Start Minecraft and run `/reload`
4. Stand where you'd like the Zookeeper to appear
5. Run `/function sky_zoo:setup`
6. The Zookeeper will spawn and you'll be given an instructions book and two name tags to get you started.

## What happens if the Zookeeper dies?

The Zookeeper is invulnerable which means they cannot take damage from mobs or players. However, if the Zookeeper falls off of
an island into the void they will die. You can respawn the Zookeeper without affecting the your progress using:

```
/function sky_zoo:spawn_zookeeper
```

You shouldn't use `/function sky_zoo:setup` as this will reset everything again.

## How to change the mob capture list and their rewards

1. Edit `mobs.csv` to add new mobs, change existing trades or remove mobs from the capture list.
2. Regenerate Minecraft functions, advancements and zip the pack up with `ruby .\generate.rb`.
3. Copy `./build/sky-zoo.zip` and place in the `datapacks` folder your Minecraft world.
4. Run `/reload` and then `/function sky_zoo:setup`.

## Development Requirements

* Install Ruby 2.6+
* Install the Rubyzip gem with `gem install rubyzip`
