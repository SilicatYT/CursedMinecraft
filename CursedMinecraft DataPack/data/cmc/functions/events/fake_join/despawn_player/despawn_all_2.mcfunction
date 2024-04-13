# Despawn all fake players
function cmc:events/fake_join/despawn_player/main with storage cmc:temporary FakeJoin[-1]

execute if score #cmc.ListSize cmc.Dummy matches 1 run return 0
scoreboard players remove #cmc.ListSize cmc.Dummy 1
data remove storage cmc:temporary FakeJoin[-1]
function cmc:events/fake_join/despawn_player/despawn_all_2