$data modify storage config.data:operations operation$(operation_num) set value {"index":$(index),"operation_num":$(operation_num)}

$execute as @s[tag=config.data.operation$(operation_num)] if score operation$(operation_num)$indexSaved config.data.util matches 1 run scoreboard players set operation$(operation_num)$indexSaved config.data.util 0
$execute as @s[tag=!config.data.operation$(operation_num)] unless score operation$(operation_num)$indexSaved config.data.util matches 1 store success score operation$(operation_num)$indexSaved config.data.util store result storage config.data:operations operation$(operation_num).index int 1 run scoreboard players get @s config.data.linked_index
$execute as @s[tag=config.data.operation$(operation_num)] if score operation$(operation_num)$indexSaved config.data.util matches 0 run data modify storage config.data:operations operation$(operation_num) set from storage config.data:config Config[$(index)]
$execute as @s[tag=!config.data.operation$(operation_num)] if score operation$(operation_num)$indexSaved config.data.util matches 1 run tag @s add config.data.operation$(operation_num)
$execute as @s[tag=config.data.operation$(operation_num)] if score operation$(operation_num)$indexSaved config.data.util matches 1 run function config:util/func/copy_index with storage config.data:operations operation$(operation_num)

$execute as @s[tag=config.data.operation$(operation_num)] if score operation$(operation_num)$indexSaved config.data.util matches 0 run return 1