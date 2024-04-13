# Check if chunks are forceloaded
$execute in $(Dimension) if loaded $(Pos0) 0 $(Pos2) run function cmc:utils/forceload/success with storage cmc:temporary Forceload[-1]

# Next Loop
execute if score #cmc.ListSize cmc.Dummy matches 1 run return 0
scoreboard players remove #cmc.ListSize cmc.Dummy 1
data remove storage cmc:temporary Forceload[-1]
execute store result storage cmc:temporary Forceload[-1].Index int 1 run scoreboard players remove #cmc.Index cmc.Dummy 1
function cmc:utils/forceload/check_2 with storage cmc:temporary Forceload[-1]