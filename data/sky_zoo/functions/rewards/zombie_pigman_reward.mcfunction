data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[25].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo zombie_pigman_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:bell",Count:1b}}
data modify storage sky_zoo zombie_pigman_reward set value 1
