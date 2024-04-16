# (This function has to be called with the fake_join storage)
$execute in $(Dimension) unless loaded $(Pos0) $(Pos1) $(Pos2) run return 0

scoreboard players remove #cmc.FakeJoin.Amount cmc.Dummy 1
$data modify storage cmc:fake_join CurrentPlayer set from storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]
$data remove storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]
execute store result score #cmc.Search cmc.PlayerID run data get storage cmc:fake_join CurrentPlayer.PlayerID

# Leave Message
execute unless score #cmc.FakeJoin.DespawnAll cmc.Dummy matches 1 run tellraw @a[predicate=!cmc:same_player_id] {"translate":"multiplayer.player.left","with":[{"nbt":"CurrentPlayer.Name","storage":"cmc:fake_join"}],"color":"yellow"}

# Remove 
execute as @e[tag=cmc.PlayerStatue.Root,predicate=cmc:same_player_id,limit=1] on passengers run kill @s
kill @e[tag=cmc.PlayerStatue,predicate=cmc:same_player_id,limit=5]

# Remove forceload
function cmc:events/fake_join/despawn_player/remove_forceload with storage cmc:fake_join CurrentPlayer

# Remove storage
data remove storage cmc:fake_join CurrentPlayer

# Enable Sleep again
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 1.. run return 0
execute store result storage cmc:temporary PlayersSleepingPercentage int 1 run scoreboard players get #cmc.PlayersSleepingPercentage cmc.Dummy
function cmc:events/fake_join/despawn_player/set_sleep_gamerule with storage cmc:temporary
data remove storage cmc:temporary PlayersSleepingPercentage