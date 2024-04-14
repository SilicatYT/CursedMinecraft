# Schedule Loop
schedule function cmc:main_1s 1s
execute store result score #cmc.GameTime cmc.Dummy run time query gametime

## Events

# Fake Join (Join)
execute if score #cmc.Timers.FakeJoin cmc.Dummy <= #cmc.GameTime cmc.Dummy run function cmc:events/fake_join/main

# Fake Join (Leave)
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 1.. as @e[type=minecraft:item_display,tag=cmc.PlayerStatue.Head] if score @s cmc.Timer <= #cmc.GameTime cmc.Dummy run function cmc:events/fake_join/despawn_player/main with entity @s item.components."minecraft:custom_data".FakeJoinData