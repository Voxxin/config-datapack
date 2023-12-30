execute as @s[tag=!config.operation.success, tag=!config.operation.resulted] run function config:util/func/is_tagged {"operation_num":-1}

execute as @s[tag=config.operation.success,nbt={interaction:{}}] run function config:util/func/handle_press {"operation_num":-1, "action":"RightClick"}
execute as @s[tag=config.operation.success,nbt={attack:{}}] run function config:util/func/handle_press {"operation_num":-1, "action":"LeftClick"}

# Clear the operation result tag
execute as @s[tag=config.operation.resulted] run data remove entity @s interaction
execute as @s[tag=config.operation.resulted] run data remove entity @s attack
execute as @s[tag=config.operation.resulted] run tag @s remove config.operation.resulted
execute as @s[tag=config.operation.success] run tag @s remove config.operation.success
