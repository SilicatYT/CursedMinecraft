# Store the player data in the 'cmc:player_data' storage for easy access during 'cmc:player/main'
$data modify storage cmc:player_data PreviousTick set from storage cmc:player_list Total[{PlayerID:$(PlayerID)}].data.CurrentTick
data modify storage cmc:player_data CurrentTick set from entity @s {}

# Store the player data in the 'cmc:player_list Total' storage
$data modify storage cmc:player_list Total[{PlayerID:$(PlayerID)}].data.PreviousTick set from storage cmc:player_data PreviousTick
$data modify storage cmc:player_list Total[{PlayerID:$(PlayerID)}].data.CurrentTick set from storage cmc:player_data CurrentTick