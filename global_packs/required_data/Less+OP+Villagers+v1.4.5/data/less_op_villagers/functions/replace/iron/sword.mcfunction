# iron/sword

loot spawn ~ ~ ~ loot less_op_villagers:cost/enchanted_tool
loot spawn ~ ~ ~ loot less_op_villagers:replace/sword

tag @e[type=item,nbt={Item:{tag:{LOVcost:1b}}},limit=1] add LOVcost
data remove entity @e[type=item,tag=LOVcost,limit=1] Item.tag.LOVcost
tag @e[type=item,nbt={Item:{tag:{LOVitem:1b}}},limit=1] add LOVitem
data remove entity @e[type=item,tag=LOVitem,limit=1] Item.tag.LOVitem

data modify entity @s Offers{}.Recipes[{sell:{id:"minecraft:iron_sword"}}].buy{id:"minecraft:emerald"}.Count set from entity @e[type=item,tag=LOVcost,limit=1] Item.Count
execute if score require_item less_op_villagers matches 1 run data modify entity @s Offers{}.Recipes[{sell:{id:"minecraft:iron_sword"}}].buyB set value {id:"minecraft:iron_sword",Count:1b}
execute unless score require_item less_op_villagers matches 1 run data modify entity @s Offers{}.Recipes[{sell:{id:"minecraft:iron_sword"}}].buyB set value {id:"minecraft:air",Count:1b}
data modify entity @s Offers{}.Recipes[].sell{id:"minecraft:iron_sword"} set from entity @e[type=item,tag=LOVitem,limit=1] Item

kill @e[type=item,tag=LOVcost,limit=1]
kill @e[type=item,tag=LOVitem,limit=1]

tag @s add LOViron
