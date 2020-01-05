advancement revoke @a from sky_zoo:root
scoreboard objectives remove sky_zoo_deaths

scoreboard objectives add sky_zoo_deaths deathCount "Deaths"
scoreboard objectives setdisplay list sky_zoo_deaths

kill @e[type=wandering_trader,name=Zookeeper,limit=1]
summon wandering_trader ~ ~1 ~ {Invulnerable:1,PersistenceRequired:1,CustomName:"\"Zookeeper\"",Offers:{Recipes:[]}}
execute as @e[type=wandering_trader,name=Zookeeper,limit=1] run function sky_zoo:zookeeper_trades

give @p written_book{pages:['{"text":"Welcome to Sky Zoo!\\n\\nThe aim of Sky Zoo is to build a zoo in a skyblock world and fill it with hostile mobs.\\n\\nIf you check your advancements, you\'ll see a new Sky Zoo tab that lists the mobs you need to capture."}','{"text":"To capture a mob simply name it \\"Captured\\" with a name tag.\\n\\nDoing so will grant you the advancement and unlock a trade with the zookeeper.\\n\\nOnce all the mobs listed have been captured, your zoo is complete!"}','{"text":"Be sure to name the mobs correctly, it must be \\"Captured\\" with the correct case.\\n\\nOn the tab screen is a death counter per player. If you want an extra challenge, try to complete the zoo with no more than 5 deaths each."}','{"text":"Once all mobs are captured you\'ll see a congratulations message.\\n\\nYou start with the first 2 name tags in your inventory.\\n\\nGood luck creating your very own zoo!\\n\\nLogic"}'],title:"Sky Zoo",author:LogicalGeekBoy,display:{Lore:["How to play Sky Zoo"]}}
give @p name_tag{display:{Name:"{\"text\":\"Captured\"}"}} 2

tellraw @a {"text":"Sky Zoo setup complete", "color":"green"}
