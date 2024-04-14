# Reset scores & tags
scoreboard players reset @s cmc.triggers.Join
tag @s remove cmc.IsSleeping

# Update Player Count
scoreboard players add #cmc.PlayerCount cmc.Dummy 1
scoreboard players add #cmc.PlayerCount.PreviousTick cmc.Dummy 1

# Add player to "Online Players" list for leave detection
loot insert 29999983 -64 29999983 loot cmc:fill_player_head
data modify storage cmc:player_list Online append value {PlayerID:0,Name:""}
execute store result storage cmc:player_list Online[-1].PlayerID int 1 run scoreboard players get @s cmc.PlayerID
data modify storage cmc:player_list Online[-1].Name set from block 29999983 -64 29999983 Items[0].components."minecraft:profile".name
item replace block 29999983 -64 29999983 container.0 with minecraft:air

# Remove player from "Offline Players" list
execute store result storage cmc:temporary PlayerID int 1 run scoreboard players get @s cmc.PlayerID
function cmc:triggers/join/remove_offline_list with storage cmc:temporary
data remove storage cmc:temporary PlayerID
