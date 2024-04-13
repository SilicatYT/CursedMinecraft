# Success: Chunk is loaded
data modify storage cmc:utils Forceload.Loaded append from storage cmc:utils Forceload.Loading[-1]
data remove storage cmc:utils Forceload.Loading[-1]
data remove storage cmc:utils Forceload.Loaded[-1].Command
$$(Command)
