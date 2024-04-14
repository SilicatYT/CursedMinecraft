# Stop Sleeping
tag @s remove cmc.IsSleeping

# Display fake sleep message
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 0 run return 0

scoreboard players operation #cmc.CountRequired cmc.Dummy = #cmc.PlayerCount cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy += #cmc.FakeJoin.Amount cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy *= #cmc.PlayersSleepingPercentage cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy /= #cmc.100 cmc.Dummy

execute store result score #cmc.PlayersSleeping cmc.Dummy if entity @a[tag=cmc.IsSleeping]

scoreboard players set #cmc.DisplaySleepMessage cmc.Dummy 1