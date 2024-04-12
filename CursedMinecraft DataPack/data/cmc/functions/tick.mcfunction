# Player Main (e.g. store player data)
execute as @a run function cmc:player/main

# Triggers
execute as @a[scores={cmc.triggers.Join=1..}] run function cmc:triggers/join

# Check if a player leaves
execute store result score #cmc.PlayerCount cmc.Dummy if entity @a
execute unless score #cmc.PlayerCount cmc.Dummy = #cmc.PlayerCount.PreviousTick cmc.Dummy run function cmc:triggers/player_left