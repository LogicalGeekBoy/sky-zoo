data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[10].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo husk_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:honey_block",Count:16b}}
data modify storage sky_zoo husk_reward set value 1
