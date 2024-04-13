$data modify storage cmc:utils Forceload.Loading[-1].ChunkPos set value "$(0) $(2)"
execute store result storage cmc:utils Forceload.Loading[-1].Pos0 int 1 run data get storage cmc:fake_join Players[-1].Pos0
execute store result storage cmc:utils Forceload.Loading[-1].Pos2 int 1 run data get storage cmc:fake_join Players[-1].Pos2
data modify storage cmc:utils Forceload.Loading[-1].Dimension set from storage cmc:fake_join Players[-1].Dimension

execute store result storage cmc:utils Forceload.Loading[-1].ID int 1 store result storage cmc:fake_join Players[-1].ForceloadID int 1 run scoreboard players add #cmc.ForceloadID cmc.Dummy 1

function cmc:utils/forceload/load with storage cmc:utils Forceload.Loading[-1]
