data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[14].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo ravager_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:netherrack",Count:32b}}
data modify storage sky_zoo ravager_reward set value 1
