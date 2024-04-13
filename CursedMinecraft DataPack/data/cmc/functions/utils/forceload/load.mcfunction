# Forceload the chunk
$execute in $(Dimension) store success score #cmc.SuccessCheck cmc.Dummy run forceload add $(Pos0) $(Pos2)
$execute if score #cmc.SuccessCheck cmc.Dummy matches 0 unless data storage cmc:utils Forceload.Total[{Dimension:"$(Dimension)",ChunkPos:"$(ChunkPos)"}] run data modify storage cmc:utils Forceload.Total append value {Dimension:"$(Dimension)",ChunkPos:"$(ChunkPos)",Manual:1b}
data modify storage cmc:utils Forceload.Total append value {}
data modify storage cmc:utils Forceload.Total[-1].Dimension set from storage cmc:utils Forceload.Loading[-1].Dimension
data modify storage cmc:utils Forceload.Total[-1].ChunkPos set from storage cmc:utils Forceload.Loading[-1].ChunkPos
data modify storage cmc:utils Forceload.Total[-1].ID set from storage cmc:utils Forceload.Loading[-1].ID
$execute in $(Dimension) unless loaded $(Pos0) 0 $(Pos2) run return run schedule function cmc:utils/forceload/check 1t
function cmc:utils/forceload/success_instant with storage cmc:utils Forceload.Loading[-1]