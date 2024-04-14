# Get player's data from storage
$execute store result storage cmc:temporary PlayerID int 1 run data get storage cmc:temporary Players.Available[$(Index)].PlayerID
function cmc:events/fake_join/get_player_2 with storage cmc:temporary
data remove storage cmc:temporary PlayerID