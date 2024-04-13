# Init
scoreboard objectives add cmc.Dummy dummy
execute unless score #cmc.Init cmc.Dummy matches 1 run function cmc:init

# Make 'Fake Join Players' disappear (Without a "%s has left" message)
execute unless data storage cmc:fake_join {Players:[]} run function cmc:events/fake_join/despawn_player/despawn_all