# Sky Zoo Datapack

## How to change the rewards for capturing a mob

1. Edit `mobs.csv` to add new mobs or change the zookeeper trades.
2. Regenerate Minecraft functions and advancements with `ruby .\generate.rb`
3. Zip up the pack and place in your MC world
4. Run `/reload` and then `/function sky_zoo:setup`

## TODO

* When all advancements made, should we do something?
* Apply glowing to the zookeeper at night
* Review rewards and costs for new map (other rewards rather than trades? A book to skip day? Control the weather? etc)
* Map changes:
    * Add book with instructions
    * Change/remove items on map to make reward trades more valuable
* Add build script to zip up correct files for datapack
* Add licence
