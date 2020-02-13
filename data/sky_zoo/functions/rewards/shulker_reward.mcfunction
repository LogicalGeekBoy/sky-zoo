data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[15].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo shulker_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:sweet_berries",Count:8b}}
data modify storage sky_zoo shulker_reward set value 1
