# First Join (Can't be an advancement because it would run after this tick function, so it would run without a PlayerID set)
execute as @a unless score @s cmc.PlayerID matches 1.. run function cmc:triggers/first_join

# Player Main (e.g. store player data)
execute as @a run function cmc:player/main

# Triggers
execute as @a[scores={cmc.triggers.Join=1..}] run function cmc:triggers/join
execute as @a[tag=cmc.IsSleeping] unless data entity @s SleepingX run function cmc:triggers/stop_sleeping

# Check if a player leaves
execute store result score #cmc.PlayerCount cmc.Dummy if entity @a
execute unless score #cmc.PlayerCount cmc.Dummy = #cmc.PlayerCount.PreviousTick cmc.Dummy run function cmc:triggers/player_left

# Events
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 1.. at @a as @e[type=minecraft:item_display,tag=cmc.PlayerStatue.Head,distance=..4,limit=1] run function cmc:events/fake_join/despawn_player/main with entity @s item.components."minecraft:custom_data".FakeJoinData

# Fake sleep message if fake players are online
execute if score #cmc.DisplaySleepMessage cmc.Dummy matches 1 unless score #cmc.PlayersSleeping cmc.Dummy matches 0 if score #cmc.PlayersSleeping cmc.Dummy >= #cmc.PlayersSleepingRequired cmc.Dummy run title @a actionbar {"translate":"sleep.skipping_night"}
execute if score #cmc.DisplaySleepMessage cmc.Dummy matches 1 unless score #cmc.PlayersSleepingPercentage cmc.Dummy matches 101.. unless score #cmc.PlayersSleeping cmc.Dummy >= #cmc.PlayersSleepingRequired cmc.Dummy run title @a actionbar {"translate":"sleep.players_sleeping","with":[{"score":{"name":"#cmc.PlayersSleeping","objective":"cmc.Dummy"}},{"score":{"name":"#cmc.PlayersSleepingRequired","objective":"cmc.Dummy"}}]}
execute if score #cmc.DisplaySleepMessage cmc.Dummy matches 1 run scoreboard players reset #cmc.DisplaySleepMessage