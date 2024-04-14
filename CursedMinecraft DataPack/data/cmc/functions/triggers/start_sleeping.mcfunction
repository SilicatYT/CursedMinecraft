# Slept in bed (Started sleeping)
advancement revoke @s only cmc:start_sleeping
tag @s add cmc.IsSleeping

# Cancel the sleep if a fake player is online (Still allow sleep depending on the gamerule)
execute unless score #cmc.FakeJoin.Amount cmc.Dummy matches 1.. run return 0

scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy = #cmc.PlayerCount cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy += #cmc.FakeJoin.Amount cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy *= #cmc.PlayersSleepingPercentage cmc.Dummy
scoreboard players operation #cmc.PlayersSleepingRequired cmc.Dummy /= #cmc.100 cmc.Dummy

execute store result score #cmc.PlayersSleeping cmc.Dummy if entity @a[tag=cmc.IsSleeping]
execute if score #cmc.PlayersSleeping cmc.Dummy >= #cmc.PlayersSleepingRequired cmc.Dummy run gamerule playersSleepingPercentage 0

scoreboard players set #cmc.DisplaySleepMessage cmc.Dummy 1