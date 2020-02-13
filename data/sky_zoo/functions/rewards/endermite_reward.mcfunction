data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[6].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo endermite_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:shulker_shell",Count:2b}}
data modify storage sky_zoo endermite_reward set value 1
