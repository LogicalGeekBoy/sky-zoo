data modify entity @e[type=wandering_trader,limit=1] Offers.Recipes[1].maxUses set value 99999
execute at @e[type=wandering_trader,limit=1] unless data storage sky_zoo charged_creeper_reward run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:elytra",Count:1b}}
data modify storage sky_zoo charged_creeper_reward set value 1
