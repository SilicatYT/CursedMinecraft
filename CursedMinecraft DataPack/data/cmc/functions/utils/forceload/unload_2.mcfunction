# Unforceload the chunk
$execute unless data storage cmc:utils Forceload.Total[{Dimension:"$(Dimension)",ChunkPos:"$(ChunkPos)"}] in $(Dimension) run forceload remove $(Pos0) $(Pos2)
$data remove storage cmc:utils Forceload.Loaded[{ID:$(ID)}]