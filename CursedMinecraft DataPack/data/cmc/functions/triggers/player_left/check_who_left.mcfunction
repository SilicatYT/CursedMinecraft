# Iterate through the "Online Players" list to see who left
$execute unless entity $(Name) run function cmc:triggers/player_left/leave with storage cmc:player_list Temporary[-1]

# Next Loop
execute if score #cmc.ListSize cmc.Dummy matches 1 run return 0
scoreboard players remove #cmc.ListSize cmc.Dummy 1
data remove storage cmc:player_list Temporary[-1]
function cmc:triggers/player_left/check_who_left with storage cmc:player_list Temporary[-1]