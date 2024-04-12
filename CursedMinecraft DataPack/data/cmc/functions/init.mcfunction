# Init
scoreboard players set #cmc.Init cmc.Dummy 1

# Forceloads & Blocks
forceload add 29999983 29999983
setblock 29999983 -64 29999983 minecraft:yellow_shulker_box

# Scoreboards
scoreboard players set #cmc.ObviousMeter cmc.Dummy 1

scoreboard objectives add cmc.triggers.Join minecraft.custom:minecraft.leave_game
scoreboard objectives add cmc.PlayerID dummy