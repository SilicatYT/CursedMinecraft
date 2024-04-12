# Player left
$data remove storage cmc:player_list Online[{PlayerID:$(PlayerID)}]

# Trigger "Double Leave Message" (Random Chance: 1% per ObviousMeter Value)
execute store result score #cmc.RNG cmc.Dummy run random value 1..100
execute if score #cmc.RNG cmc.Dummy <= #cmc.ObviousMeter cmc.Dummy run function cmc:events/double_leave_message/main