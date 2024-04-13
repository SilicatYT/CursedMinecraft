# Check if chunks are forceloaded
execute store result score #cmc.ListSize cmc.Dummy if data storage cmc:utils Forceload.Loading[]
scoreboard players operation #cmc.Index cmc.Dummy = #cmc.ListSize cmc.Dummy

data modify storage cmc:temporary Forceload set from storage cmc:utils Forceload.Loading
execute store result storage cmc:temporary Forceload[-1].Index int 1 run scoreboard players remove #cmc.Index cmc.Dummy 1
function cmc:utils/forceload/check_2 with storage cmc:temporary Forceload[-1]
data remove storage cmc:temporary Forceload

execute unless data storage cmc:utils {Forceload:{Loading:[]}} run schedule function cmc:utils/forceload/check 1t