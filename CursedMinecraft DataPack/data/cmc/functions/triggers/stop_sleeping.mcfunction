# Stop Sleeping
tag @s remove cmc.IsSleeping

# Display fake sleep message
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 0 run return 0

scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy = #cmc.PlayerCount cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy += #cmc.FakeJoin.Amount cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy *= #cmc.PlayersSleepingPercentage cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy /= #cmc.100 cmc.Dummy

execute store result score #cmc.PlayersSleeping cmc.Dummy if entity @a[tag=cmc.IsSleeping]
execute unless score #cmc.PlayersSleeping cmc.Dummy >= #cmc.PlayersSleepingRequired cmc.Dummy run gamerule playersSleepingPercentage 101

execute store result score #cmc.DayTime cmc.Dummy run time query daytime
execute unless score #cmc.DayTime cmc.Dummy matches 1 run scoreboard players set #cmc.DisplaySleepMessage cmc.Dummy 1