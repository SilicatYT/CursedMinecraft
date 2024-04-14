# Prepare list of available players (Offline and not a statue already)
$data remove storage cmc:temporary Players.Available[{PlayerID:$(PlayerID)}]

# Next Loop
execute if score #cmc.ListSize cmc.Dummy matches 1 run return 0
scoreboard players remove #cmc.ListSize cmc.Dummy 1
data remove storage cmc:temporary Players.Used[-1]
function cmc:events/fake_join/get_available_players with storage cmc:temporary Players.Used[-1]