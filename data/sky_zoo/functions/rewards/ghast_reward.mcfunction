data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[8].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo ghast_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:nether_quartz_ore",Count:32b}}
data modify storage sky_zoo ghast_reward set value 1
