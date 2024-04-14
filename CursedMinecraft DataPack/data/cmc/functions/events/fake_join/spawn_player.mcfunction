scoreboard players add #cmc.FakeJoin.Amount cmc.Dummy 1

$data modify storage cmc:fake_join CurrentPlayer set from storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]

$data remove storage cmc:fake_join Players[{PlayerID:$(PlayerID)}]
data modify storage cmc:fake_join Players append value {}
data modify storage cmc:fake_join Players[-1].PlayerID set from storage cmc:fake_join CurrentPlayer.PlayerID
data modify storage cmc:fake_join Players[-1].ForceloadID set from storage cmc:fake_join CurrentPlayer.ForceloadID
data modify storage cmc:fake_join Players[-1].Name set from storage cmc:fake_join CurrentPlayer.Name
execute store result storage cmc:fake_join Players[-1].Pos0 int 1 run data get storage cmc:fake_join CurrentPlayer.Pos0
execute store result storage cmc:fake_join Players[-1].Pos1 int 1 run data get storage cmc:fake_join CurrentPlayer.Pos1
execute store result storage cmc:fake_join Players[-1].Pos2 int 1 run data get storage cmc:fake_join CurrentPlayer.Pos2
data modify storage cmc:fake_join Players[-1].Dimension set from storage cmc:fake_join CurrentPlayer.Dimension

# Join Message
tellraw @a {"translate":"multiplayer.player.joined","with":[{"nbt":"CurrentPlayer.Name","storage":"cmc:fake_join"}],"color":"yellow"}

# Player Model
execute store result score #cmc.Search cmc.PlayerID run data get storage cmc:fake_join CurrentPlayer.PlayerID

execute store result score #cmc.Rotation cmc.Dummy run data get storage cmc:fake_join CurrentPlayer.data.CurrentTick.Rotation[0] 100
execute store result score #cmc.Rotation2 cmc.Dummy run random value -4500..4500
execute store result storage cmc:temporary Rotation.BodyRotation float 0.01 run scoreboard players operation #cmc.Rotation cmc.Dummy += #cmc.Rotation2 cmc.Dummy
execute store result storage cmc:temporary Rotation.BodyRotationPlus90 float 0.01 run scoreboard players add #cmc.Rotation cmc.Dummy 9000
execute store result storage cmc:temporary Rotation.BodyRotationPlus180 float 0.01 run scoreboard players add #cmc.Rotation cmc.Dummy 9000
execute store result storage cmc:temporary Rotation.BodyRotationMinus90 float 0.01 run scoreboard players remove #cmc.Rotation cmc.Dummy 27000
$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run function cmc:events/fake_join/spawn_player/create_model with storage cmc:temporary Rotation
data remove storage cmc:temporary Rotation

# Name
data modify entity @e[type=minecraft:block_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Name,limit=1] CustomName set from storage cmc:fake_join CurrentPlayer.Name

# Equipment
item modify entity @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue,limit=1] contents cmc:fake_join/copy_data

execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:103b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorHead,limit=1] ArmorItems[3] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:103b}]
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:102b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] ArmorItems[2] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:102b}]
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:101b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] ArmorItems[1] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:101b}]
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:100b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] ArmorItems[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:100b}]
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:100b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] ArmorItems[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:100b}]

execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.SelectedItem run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] HandItems[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.SelectedItem
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:-106b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] HandItems[1] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:-106b}]

# Rotation
$execute as @e[tag=cmc.Temp,tag=cmc.PlayerStatue.Head,limit=2] at @s run tp @s ~ ~ ~ ~$(Rotation0) ~$(Rotation1Inverted)
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:103b}] run data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorHead,limit=1] Pose.Head[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Rotation[1]

# Despawn Timer (Min: <ObviousMeter - 2> * 2 minutes, Max: <ObviousMeter - 2> * 10 minutes)
execute store result score #cmc.GameTime cmc.Dummy run time query gametime
execute if score #cmc.ObviousMeter cmc.Dummy matches ..3 store result score #cmc.Timer cmc.Dummy run random value 2400..12000
execute if score #cmc.ObviousMeter cmc.Dummy matches 4 store result score #cmc.Timer cmc.Dummy run random value 4800..24000
execute if score #cmc.ObviousMeter cmc.Dummy matches 5 store result score #cmc.Timer cmc.Dummy run random value 7200..36000
execute if score #cmc.ObviousMeter cmc.Dummy matches 6 store result score #cmc.Timer cmc.Dummy run random value 9600..48000
execute if score #cmc.ObviousMeter cmc.Dummy matches 7 store result score #cmc.Timer cmc.Dummy run random value 12000..60000
execute if score #cmc.ObviousMeter cmc.Dummy matches 8 store result score #cmc.Timer cmc.Dummy run random value 14400..72000
execute if score #cmc.ObviousMeter cmc.Dummy matches 9 store result score #cmc.Timer cmc.Dummy run random value 16800..84000
execute if score #cmc.ObviousMeter cmc.Dummy matches 10 store result score #cmc.Timer cmc.Dummy run random value 19200..96000
execute store result score @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Head,limit=1] cmc.Timer run scoreboard players operation #cmc.Timer cmc.Dummy += #cmc.GameTime cmc.Dummy

# Queue next player spawn
function cmc:obvious_meter/set_timers/fake_join

# End
scoreboard players operation @e[tag=cmc.Temp,tag=cmc.PlayerStatue,limit=40] cmc.PlayerID = #cmc.Search cmc.PlayerID
tag @e[tag=cmc.Temp,tag=cmc.PlayerStatue,limit=40] remove cmc.Temp
data remove storage cmc:fake_join CurrentPlayer