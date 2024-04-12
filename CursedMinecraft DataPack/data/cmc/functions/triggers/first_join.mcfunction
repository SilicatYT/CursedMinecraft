# Set PlayerID
execute store result score @s cmc.PlayerID run scoreboard players add #cmc.PlayerID cmc.Dummy 1

# Add player to storage with PlayerID & Name
loot insert 29999983 -64 29999983 loot cmc:fill_player_head
data modify storage cmc:player_list Total append value {PlayerID:0,Name:""}
execute store result storage cmc:player_list Total[-1].PlayerID int 1 run scoreboard players get #cmc.PlayerID cmc.Dummy
data modify storage cmc:player_list Total[-1].Name set from block 29999983 -64 29999983 Items[0].components."minecraft:profile".name
item replace block 29999983 -64 29999983 container.0 with minecraft:air

# Join the game
function cmc:triggers/join