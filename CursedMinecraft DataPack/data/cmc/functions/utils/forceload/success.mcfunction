# Success: Chunk is loaded
data modify storage cmc:utils Forceload.Loaded append from storage cmc:temporary Forceload[-1]
$data remove storage cmc:utils Forceload.Loading[$(Index)]
data remove storage cmc:utils Forceload.Loaded[-1].Index
data remove storage cmc:utils Forceload.Loaded[-1].Command
$$(Command)
