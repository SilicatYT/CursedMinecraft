# Change the arm pose (To 10.65 degrees higher)
data modify entity @s[tag=cmc.PlayerStatue.ArmRight.Bottom] transformation.translation set value [-0.3525f,0.95722955703f,0.08682601034641266f]
data modify entity @s transformation.left_rotation set value {angle:-0.18587756533f,axis:[1f,0f,0f]}

# Change the arm pose (Armor Stand)
data modify entity @e[type=minecraft:armor_stand,tag=cmc.Temp,tag=cmc.PlayerStatue.ArmorBody,limit=1] Pose.RightArm[0] set value 349.35f