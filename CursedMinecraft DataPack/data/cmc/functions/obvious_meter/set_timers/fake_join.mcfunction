# Change event timers
execute if score #cmc.ObviousMeter cmc.Dummy matches 1..2 run scoreboard players reset #cmc.Timers.FakeJoin

execute if score #cmc.ObviousMeter cmc.Dummy matches 3 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 144000..432000
execute if score #cmc.ObviousMeter cmc.Dummy matches 4 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 108000..324000
execute if score #cmc.ObviousMeter cmc.Dummy matches 5 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 72000..252000
execute if score #cmc.ObviousMeter cmc.Dummy matches 6 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 64800..216000
execute if score #cmc.ObviousMeter cmc.Dummy matches 7 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 54000..144000
execute if score #cmc.ObviousMeter cmc.Dummy matches 8 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 36000..108000
execute if score #cmc.ObviousMeter cmc.Dummy matches 9 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 25200..72000
execute if score #cmc.ObviousMeter cmc.Dummy matches 10 store result score #cmc.Timers.FakeJoin cmc.Dummy run random value 18000..54000

execute if score #cmc.ObviousMeter cmc.Dummy matches 3.. run scoreboard players operation #cmc.Timers.FakeJoin cmc.Dummy += #cmc.GameTime cmc.Dummy