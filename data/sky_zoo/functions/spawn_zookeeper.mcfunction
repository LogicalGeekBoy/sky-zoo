kill @e[type=wandering_trader]
summon wandering_trader ~ ~1 ~ {Invulnerable:1,PersistenceRequired:1,CustomName:"\"Zookeeper\"",Offers:{Recipes:[]}}
execute as @e[type=wandering_trader,limit=1] run function sky_zoo:zookeeper_trades
function sky_zoo:unlock_trades
