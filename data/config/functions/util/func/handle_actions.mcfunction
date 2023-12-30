$execute store result score operation$(operation_num)$size config.data.util run data get storage config.data:operations operation$(operation_num).Action.$(action)


$execute as @s if score operation$(operation_num)$size config.data.util matches 1.. run function config:util/func/run_command with storage config.data:operations operation$(operation_num).Action.$(action)[0]
$execute as @s if score operation$(operation_num)$size config.data.util matches 1.. run data remove storage config.data:operations operation$(operation_num).Action.$(action)[0]
$execute as @s if score operation$(operation_num)$size config.data.util matches 1.. run function config:util/func/handle_actions {"operation_num":$(operation_num),"action":"$(action)"}

$execute if score operation$(operation_num)$size config.data.util matches 0 run scoreboard players reset operation$(operation_num)$size config.data.util