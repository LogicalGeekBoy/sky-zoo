advancement revoke @a from sky_zoo:root
scoreboard objectives remove sky_zoo_deaths

scoreboard objectives add sky_zoo_deaths deathCount "Deaths"
scoreboard objectives setdisplay list sky_zoo_deaths

kill @e[type=wandering_trader,name=Zookeeper,limit=1]
summon wandering_trader ~ ~1 ~ {Invulnerable:1,PersistenceRequired:1,CustomName:"\"Zookeeper\"",Offers:{Recipes:[]}}
execute as @e[type=wandering_trader,name=Zookeeper,limit=1] run function sky_zoo:zookeeper_trades

tellraw @a {"text":"Sky Zoo setup complete", "color":"green"}
