# Get Player Data ('cmc:player_data CurrentTick | PreviousTick')
execute store result storage cmc:temporary PlayerID int 1 run scoreboard players get @s cmc.PlayerID
function cmc:player/get_player_data/main with storage cmc:temporary
data remove storage cmc:temporary PlayerID

# Randomly stop motion (Roughly once every 8 minutes)
execute if score #cmc.ObviousMeter cmc.Dummy matches 4.. if predicate {"condition": "minecraft:random_chance","chance": 0.0001} run tp @s @s
