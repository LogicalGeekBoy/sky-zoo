data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[7].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo evoker_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:experience_bottle",Count:1b}}
data modify storage sky_zoo evoker_reward set value 1
