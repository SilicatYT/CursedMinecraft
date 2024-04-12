# Get Player Data ('cmc:player_data CurrentTick | PreviousTick')
execute store result storage cmc:temporary PlayerID int 1 run scoreboard players get @s cmc.PlayerID
function cmc:player/get_player_data/main with storage cmc:temporary
data remove storage cmc:temporary PlayerID