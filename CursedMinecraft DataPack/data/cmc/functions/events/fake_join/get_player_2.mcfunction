# Get player's data from storage
$data modify storage cmc:fake_join Players append from storage cmc:player_list Total[{PlayerID:$(PlayerID)}]
$data modify storage cmc:utils Forceload.Loading append value {Command:"function cmc:events/fake_join/spawn_player with storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]"}