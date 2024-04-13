# Despawn all fake players
scoreboard players set #cmc.FakeJoin.DespawnAll cmc.Dummy 1

execute store result score #cmc.ListSize cmc.Dummy run data get storage cmc:fake_join Players[]
data modify storage cmc:temporary FakeJoin set from storage cmc:fake_join Players
function cmc:events/fake_join/despawn_player/despawn_all_2
data remove storage cmc:temporary FakeJoin

scoreboard players reset #cmc.FakeJoin.DespawnAll

# In case some players weren't loaded yet
execute unless data storage cmc:fake_join {Players:[]} run schedule function cmc:events/fake_join/despawn_player/despawn_all 1t
