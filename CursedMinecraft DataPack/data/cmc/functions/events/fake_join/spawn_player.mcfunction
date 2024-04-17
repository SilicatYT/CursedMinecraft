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

# Select Skin
execute store result score #cmc.ListSize cmc.Dummy if data storage cmc:fake_join Skins[]
execute store result score #cmc.RNG cmc.Dummy run random value 0..2147483646
execute store result storage cmc:temporary Index int 1 run scoreboard players operation #cmc.RNG cmc.Dummy %= #cmc.ListSize cmc.Dummy
function cmc:events/fake_join/spawn_player/select_skin with storage cmc:temporary
data remove storage cmc:temporary Index

# Player Model
execute store result score #cmc.Search cmc.PlayerID run data get storage cmc:fake_join CurrentPlayer.PlayerID

execute store result score #cmc.Rotation cmc.Dummy run data get storage cmc:fake_join CurrentPlayer.data.CurrentTick.Rotation[0] 100
execute store result score #cmc.Rotation2 cmc.Dummy run random value -4500..4500
data modify storage cmc:temporary Statue.Rotation0 set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Rotation[0]
data modify storage cmc:temporary Statue.Rotation1 set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Rotation[1]
execute store result storage cmc:temporary Statue.BodyRotation float 0.01 run scoreboard players operation #cmc.Rotation cmc.Dummy += #cmc.Rotation2 cmc.Dummy
$execute in $(Dimension) positioned $(Pos0) $(Pos1) $(Pos2) run function cmc:events/fake_join/spawn_player/create_model with storage cmc:temporary Statue
data remove storage cmc:temporary Statue

# Name
data modify entity @e[type=minecraft:block_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Name,limit=1] CustomName set from storage cmc:fake_join CurrentPlayer.Name

# Equipment (Need to optimise it by only running @e or /data if the data is present)
item modify entity @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Head,limit=1] contents cmc:fake_join/copy_data

data modify storage cmc:temporary Equipment set value {ArmorItems:[{},{},{},{}],HandItems:[{},{}]}
data modify storage cmc:temporary Equipment.ArmorItems[2] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:102b}]
data modify storage cmc:temporary Equipment.ArmorItems[1] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:101b}]
data modify storage cmc:temporary Equipment.ArmorItems[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:100b}]
data remove storage cmc:temporary Equipment.ArmorItems[].Slot


data modify storage cmc:temporary Equipment.HandItems[0] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.SelectedItem
data modify storage cmc:temporary Equipment.HandItems[1] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:-106b}]

execute as @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] run data modify entity @s ArmorItems set from storage cmc:temporary Equipment.ArmorItems
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:103b}] as @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorHead,limit=1] run data modify entity @s ArmorItems[3] set from storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:103b}]
execute as @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] run data modify entity @s HandItems set from storage cmc:temporary Equipment.HandItems

execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.SelectedItem as @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Root,limit=1] on passengers if entity @s[tag=cmc.PlayerStatue.ArmRight] run function cmc:events/fake_join/pose/holding_item_mainhand
execute if data storage cmc:fake_join CurrentPlayer.data.CurrentTick.Inventory[{Slot:-106b}] as @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Root,limit=1] on passengers if entity @s[tag=cmc.PlayerStatue.ArmLeft] run function cmc:events/fake_join/pose/holding_item_offhand

data remove storage cmc:temporary Equipment

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
execute store result score @e[type=minecraft:item_display,tag=cmc.Temp,tag=cmc.PlayerStatue.Root,limit=1] cmc.Timer run scoreboard players operation #cmc.Timer cmc.Dummy += #cmc.GameTime cmc.Dummy

# Queue next player spawn
function cmc:obvious_meter/set_timers/fake_join

# Disable Sleep
execute if score #cmc.FakeJoin.Amount cmc.Dummy matches 1 store result score #cmc.PlayersSleepingPercentage cmc.Dummy run gamerule playersSleepingPercentage
gamerule playersSleepingPercentage 101

# End
scoreboard players operation @e[tag=cmc.Temp,tag=cmc.PlayerStatue,limit=5] cmc.PlayerID = #cmc.Search cmc.PlayerID
tag @e[tag=cmc.Temp,limit=5] remove cmc.Temp
data remove storage cmc:fake_join CurrentPlayer