# Init
scoreboard players set #cmc.Init cmc.Dummy 1

# Forceloads & Blocks
forceload add 29999983 29999983
setblock 29999983 -64 29999983 minecraft:yellow_shulker_box

# Constants
scoreboard players set #cmc.16 cmc.Dummy 16

# Scoreboards
scoreboard players set #cmc.ObviousMeter cmc.Dummy 1
scoreboard players set #cmc.ForceloadID cmc.Dummy 2147483647

scoreboard objectives add cmc.triggers.Join minecraft.custom:minecraft.leave_game
scoreboard objectives add cmc.PlayerID dummy

# Other
data modify storage cmc:player_list Offline set value []