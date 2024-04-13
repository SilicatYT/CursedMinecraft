# Unforceload the chunk
$data remove storage cmc:utils Forceload.Total[{ID:$(ID)}]

$execute store success score #cmc.SuccessCheck cmc.Dummy if data storage cmc:utils Forceload.Loaded[{ID:$(ID)}]
$execute if score #cmc.SuccessCheck cmc.Dummy matches 1 run return run function cmc:utils/forceload/unload_2 with storage cmc:utils Forceload.Loaded[{ID:$(ID)}]
$execute if score #cmc.SuccessCheck cmc.Dummy matches 0 run return run function cmc:utils/forceload/unload_3 with storage cmc:utils Forceload.Loading[{ID:$(ID)}]