## Basic Operation
# Check players without the "in_operation" tag and with a specific util score condition
$execute as @s[tag=!config.data.in_operation] if score operation$(operation_num)$assigned config.data.util matches -100 run tag @s add config.data.start_operation

# Check players not in an operation, if the util score condition is met, tag them and broadcast a message
$execute as @s[tag=!config.data.in_operation] unless score operation$(operation_num)$assigned config.data.util matches -100 run scoreboard players set operation$(operation_num)$assigned config.data.util 1
$execute as @s[tag=!config.data.in_operation,tag=config.data.start_operation] if score operation$(operation_num)$assigned config.data.util matches 1 run tag @s add config.data.in_operation

# Remove the "start_operation" tag after executing functions
$execute as @s[tag=config.data.start_operation] unless score operation$(operation_num)$assigned config.data.util matches -100 run tag @s remove config.data.start_operation
execute as @s[tag=!config.data.in_operation,tag=!config.data.start_operation] run scoreboard players remove operation$RunningNum config.data.util 1

# Remove data related to operations from storage
execute as @s[tag=config.data.in_operation,tag=!config.data.start_operation] run data remove storage config.data:operations availableOperations[-1]

# Retrieve data from the config storage and store it in the "util" score
$execute as @s[tag=config.data.in_operation,tag=!config.data.start_operation] store result score operation$(operation_num)$index config.data.util run data get storage config.data:config Config

$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$assigned config.data.util matches -100 run tag @s remove config.data.in_operation

# Execute functions for players with the start operation tag
execute as @s[tag=!config.data.in_operation,tag=config.data.start_operation] run function config:util/func/create_operation

# Runs your function with your operation number
execute as @s[tag=!config.data.in_operation,tag=config.data.start_operation] run function config:util/func/is_tagged with storage config.data:operations availableOperations[-1]

## End of basic operation

# This code is commented because it doesn't making anything return, fail nor success.
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$assigned config.data.util matches -100 run tag @s remove config.data.in_operation
$execute as @s[tag=config.data.in_operation] store result score operation$(operation_num)$success config.data.util run function config:util/func/check_tags {"operation_num": $(operation_num), "index": 0, "self_tag":"empty","common_tag":"empty"}
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run tag @s add config.operation.resulted
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run tag @s add config.operation.success
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run data remove storage config.data:operations operation$(operation_num)
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run scoreboard players reset operation$(operation_num)$tag_accurate config.data.util
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run scoreboard players reset operation$(operation_num)$assigned config.data.util
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run scoreboard players reset operation$(operation_num)$index config.data.util
$execute as @s[tag=config.data.in_operation] if score operation$(operation_num)$success config.data.util matches 1 run scoreboard players reset operation$(operation_num)$success config.data.util