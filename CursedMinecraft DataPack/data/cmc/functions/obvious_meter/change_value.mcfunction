# Change the value for the Obvious Meter to add or remove certain effects or make them stronger or weaker
$scoreboard players set #cmc.ObviousMeter.NewValue cmc.Dummy $(Value)
execute if score #cmc.ObviousMeter cmc.Dummy = #cmc.ObviousMeter.NewValue cmc.Dummy run return run tellraw @s [{"text":"The 'Obvious Meter' already has that value.","color":"red"}]
execute if score #cmc.ObviousMeter.NewValue cmc.Dummy matches ..0 run return run tellraw @s [{"text":"The 'Obvious Meter' value cannot be below 1.","color":"red"}]
execute if score #cmc.ObviousMeter.NewValue cmc.Dummy matches 11.. run return run tellraw @s [{"text":"The 'Obvious Meter' value cannot be above 10.","color":"red"}]

scoreboard players operation #cmc.ObviousMeter cmc.Dummy = #cmc.ObviousMeter.NewValue cmc.Dummy
tellraw @s "Successfully changed the 'Obvious Meter' value."
playsound minecraft:entity.experience_orb.pickup master @s

# Change event timers
execute store result score #cmc.GameTime cmc.Dummy run time query gametime

function cmc:obvious_meter/set_timers/fake_join