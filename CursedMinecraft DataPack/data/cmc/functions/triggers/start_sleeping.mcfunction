# Slept in bed (Started sleeping)
advancement revoke @s only cmc:start_sleeping
tag @s add cmc.IsSleeping

# Cancel the sleep if a fake player is online
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 0 run return 0

scoreboard players operation #cmc.CountRequired cmc.Dummy = #cmc.PlayerCount cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy += #cmc.FakeJoin.Amount cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy *= #cmc.PlayersSleepingPercentage cmc.Dummy
scoreboard players operation #cmc.CountRequired cmc.Dummy /= #cmc.100 cmc.Dummy

execute store result score #cmc.PlayersSleeping cmc.Dummy if entity @a[tag=cmc.IsSleeping]

scoreboard players set #cmc.DisplaySleepMessage cmc.Dummy 1