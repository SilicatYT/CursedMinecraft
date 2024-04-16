# Elect random offline player (Stop if no available player exists)
execute if data storage cmc:player_list {Offline:[]} run return 0

execute store result score #cmc.ListSize cmc.Dummy if data storage cmc:player_list Offline[]
execute if score #cmc.ListSize cmc.Dummy = #cmc.FakeJoin.Amount cmc.Dummy run return 0

# Elect random offline player (Create list of available players)
data modify storage cmc:temporary Players.Available set from storage cmc:player_list Offline
data modify storage cmc:temporary Players.Used set from storage cmc:fake_join Players
scoreboard players operation #cmc.ListSize cmc.Dummy = #cmc.FakeJoin.Amount cmc.Dummy
execute if score #cmc.ListSize cmc.Dummy matches 1.. run function cmc:events/fake_join/get_available_players with storage cmc:temporary Players.Used[-1]

execute store result score #cmc.ListSize cmc.Dummy if data storage cmc:temporary Players.Available[]
execute store result score #cmc.RNG cmc.Dummy run random value 0..2147483646
execute store result storage cmc:temporary Index int 1 run scoreboard players operation #cmc.RNG cmc.Dummy %= #cmc.ListSize cmc.Dummy

# Get player's data from storage
function cmc:events/fake_join/get_player with storage cmc:temporary
data remove storage cmc:temporary Index
data remove storage cmc:temporary Players

# Fake Join
data modify storage cmc:fake_join Players[-1].Dimension set from storage cmc:fake_join Players[-1].data.CurrentTick.Dimension
data modify storage cmc:fake_join Players[-1].Pos0 set from storage cmc:fake_join Players[-1].data.CurrentTick.Pos[0]
data modify storage cmc:fake_join Players[-1].Pos1 set from storage cmc:fake_join Players[-1].data.CurrentTick.Pos[1]
data modify storage cmc:fake_join Players[-1].Pos2 set from storage cmc:fake_join Players[-1].data.CurrentTick.Pos[2]

execute store result score #cmc.ChunkPos0 cmc.Dummy run data get storage cmc:fake_join Players[-1].Pos0
execute store result storage cmc:temporary ChunkPos.0 int 1 run scoreboard players operation #cmc.ChunkPos0 cmc.Dummy /= #cmc.16 cmc.Dummy
execute store result score #cmc.ChunkPos2 cmc.Dummy run data get storage cmc:fake_join Players[-1].Pos2
execute store result storage cmc:temporary ChunkPos.2 int 1 run scoreboard players operation #cmc.ChunkPos2 cmc.Dummy /= #cmc.16 cmc.Dummy
function cmc:events/fake_join/forceload with storage cmc:temporary ChunkPos
data remove storage cmc:temporary ChunkPos