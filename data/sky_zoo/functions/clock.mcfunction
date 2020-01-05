execute as @e[type=minecraft:blaze,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_blaze=false}] only sky_zoo:capture_blaze
execute as @e[type=minecraft:creeper,name=Captured,nbt={powered:1b}] run advancement grant @a[advancements={sky_zoo:capture_charged_creeper=false}] only sky_zoo:capture_charged_creeper
execute as @e[type=minecraft:creeper,name=Captured,nbt={}] unless data entity @s powered run advancement grant @a[advancements={sky_zoo:capture_creeper=false}] only sky_zoo:capture_creeper
execute as @e[type=minecraft:drowned,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_drowned=false}] only sky_zoo:capture_drowned
execute as @e[type=minecraft:elder_guardian,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_elder_guardian=false}] only sky_zoo:capture_elder_guardian
execute as @e[type=minecraft:enderman,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_enderman=false}] only sky_zoo:capture_enderman
execute as @e[type=minecraft:endermite,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_endermite=false}] only sky_zoo:capture_endermite
execute as @e[type=minecraft:evoker,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_evoker=false}] only sky_zoo:capture_evoker
execute as @e[type=minecraft:ghast,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_ghast=false}] only sky_zoo:capture_ghast
execute as @e[type=minecraft:guardian,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_guardian=false}] only sky_zoo:capture_guardian
execute as @e[type=minecraft:husk,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_husk=false}] only sky_zoo:capture_husk
execute as @e[type=minecraft:magma_cube,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_magma_cube=false}] only sky_zoo:capture_magma_cube
execute as @e[type=minecraft:phantom,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_phantom=false}] only sky_zoo:capture_phantom
execute as @e[type=minecraft:pillager,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_pillager=false}] only sky_zoo:capture_pillager
execute as @e[type=minecraft:ravager,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_ravager=false}] only sky_zoo:capture_ravager
execute as @e[type=minecraft:shulker,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_shulker=false}] only sky_zoo:capture_shulker
execute as @e[type=minecraft:skeleton,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_skeleton=false}] only sky_zoo:capture_skeleton
execute as @e[type=minecraft:slime,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_slime=false}] only sky_zoo:capture_slime
execute as @e[type=minecraft:spider,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_spider=false}] only sky_zoo:capture_spider
execute as @e[type=minecraft:stray,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_stray=false}] only sky_zoo:capture_stray
execute as @e[type=minecraft:vindicator,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_vindicator=false}] only sky_zoo:capture_vindicator
execute as @e[type=minecraft:witch,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_witch=false}] only sky_zoo:capture_witch
execute as @e[type=minecraft:wither,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_wither=false}] only sky_zoo:capture_wither
execute as @e[type=minecraft:wither_skeleton,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_wither_skeleton=false}] only sky_zoo:capture_wither_skeleton
execute as @e[type=minecraft:zombie,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_zombie=false}] only sky_zoo:capture_zombie
execute as @e[type=minecraft:zombie_pigman,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_zombie_pigman=false}] only sky_zoo:capture_zombie_pigman
execute as @e[type=minecraft:zombie_villager,name=Captured,nbt={}] run advancement grant @a[advancements={sky_zoo:capture_zombie_villager=false}] only sky_zoo:capture_zombie_villager

# Grant the zoo complete advancement if all mobs captured
advancement grant @a[advancements={sky_zoo:zoo_complete=false,sky_zoo:capture_blaze=true,sky_zoo:capture_charged_creeper=true,sky_zoo:capture_creeper=true,sky_zoo:capture_drowned=true,sky_zoo:capture_elder_guardian=true,sky_zoo:capture_enderman=true,sky_zoo:capture_endermite=true,sky_zoo:capture_evoker=true,sky_zoo:capture_ghast=true,sky_zoo:capture_guardian=true,sky_zoo:capture_husk=true,sky_zoo:capture_magma_cube=true,sky_zoo:capture_phantom=true,sky_zoo:capture_pillager=true,sky_zoo:capture_ravager=true,sky_zoo:capture_shulker=true,sky_zoo:capture_skeleton=true,sky_zoo:capture_slime=true,sky_zoo:capture_spider=true,sky_zoo:capture_stray=true,sky_zoo:capture_vindicator=true,sky_zoo:capture_witch=true,sky_zoo:capture_wither=true,sky_zoo:capture_wither_skeleton=true,sky_zoo:capture_zombie=true,sky_zoo:capture_zombie_pigman=true,sky_zoo:capture_zombie_villager=true}] only sky_zoo:zoo_complete

# Give the zookeeper glowing effect at night
execute store result score @a sky_zoo_time run time query daytime
execute as @a if score @s sky_zoo_time matches 12560..23485 run effect give @e[type=wandering_trader,name=Zookeeper,limit=1] minecraft:glowing 1 0 true
