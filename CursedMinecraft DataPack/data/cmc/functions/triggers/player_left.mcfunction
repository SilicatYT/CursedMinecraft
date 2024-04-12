# Update the PlayerCount
scoreboard players operation #cmc.PlayerCount.PreviousTick cmc.Dummy = #cmc.PlayerCount cmc.Dummy

# Iterate through the "Online Players" list to see who left
data modify storage cmc:player_list Temporary set from storage cmc:player_list Online
execute store result score #cmc.ListSize cmc.Dummy if data storage cmc:player_list Online[]
function cmc:triggers/player_left/check_who_left with storage cmc:player_list Temporary[-1]
data remove storage cmc:player_list Temporary