# Player Main (e.g. store player data)
execute as @a run function cmc:player/main

# Triggers
execute as @a[scores={cmc.triggers.Join=1..}] run function cmc:triggers/join

# Check if a player leaves
execute store result score #cmc.PlayerCount cmc.Dummy if entity @a
execute unless score #cmc.PlayerCount cmc.Dummy = #cmc.PlayerCount.PreviousTick cmc.Dummy run function cmc:triggers/player_left

# Events
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 1.. at @a as @e[type=minecraft:item_display,tag=cmc.PlayerStatue,distance=..8,limit=1] run function cmc:events/fake_join/despawn_player/main with entity @s item.components."minecraft:custom_data".FakeJoinData