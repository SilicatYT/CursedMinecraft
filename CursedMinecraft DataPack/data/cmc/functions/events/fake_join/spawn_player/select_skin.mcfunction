# Select skin from index
$data modify storage cmc:temporary Textures set from storage cmc:fake_join Skins[$(Index)].Textures
data modify storage cmc:temporary Statue.SkinLegRightTop set from storage cmc:temporary Textures[0]
data modify storage cmc:temporary Statue.SkinLegRightBottom set from storage cmc:temporary Textures[1]
data modify storage cmc:temporary Statue.SkinLegLeftTop set from storage cmc:temporary Textures[2]
data modify storage cmc:temporary Statue.SkinLegLeftBottom set from storage cmc:temporary Textures[3]
data modify storage cmc:temporary Statue.SkinBodyTop set from storage cmc:temporary Textures[4]
data modify storage cmc:temporary Statue.SkinBodyBottom set from storage cmc:temporary Textures[5]
data modify storage cmc:temporary Statue.SkinArmRightTop set from storage cmc:temporary Textures[6]
data modify storage cmc:temporary Statue.SkinArmRightBottom set from storage cmc:temporary Textures[7]
data modify storage cmc:temporary Statue.SkinArmLeftTop set from storage cmc:temporary Textures[8]
data modify storage cmc:temporary Statue.SkinArmLeftBottom set from storage cmc:temporary Textures[9]
data modify storage cmc:temporary Statue.SkinHead set from storage cmc:temporary Textures[10]
data remove storage cmc:temporary Textures