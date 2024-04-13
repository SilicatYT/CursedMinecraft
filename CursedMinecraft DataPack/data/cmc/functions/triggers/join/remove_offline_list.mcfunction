# Remove player from "Offline Players" list
$data remove storage cmc:player_list Offline[{PlayerID:$(PlayerID)}]

# Despawn 'fake join' statue if there is one
$execute if data storage cmc:fake_join Players[{PlayerID:$(PlayerID)}] run function cmc:events/fake_join/despawn_player/main with storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]