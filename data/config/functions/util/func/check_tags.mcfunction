# Check and store scores based on entity tags
$execute store success score operation$(operation_num)$tag_accurate config.data.util if entity @s[tag=$(self_tag),tag=$(common_tag)]

#Save the size of the config array
$execute store result score operation$(operation_num)$size config.data.util run data get storage config.data:config Config

# Merge and modify data in storage
$data merge storage config.data:operations {operation$(operation_num):{"operation_num": $(operation_num), "index": $(index), "common_tag":$(common_tag),"self_tag":$(self_tag)}}
$data modify storage config.data:operations operation$(operation_num)."common_tag" set from storage config.data:config Config[$(index)].Common_tag
$data modify storage config.data:operations operation$(operation_num)."self_tag" set from storage config.data:config Config[$(index)].Self_tag

# Lower the index score by 1 (for the next iteration)
$execute if score operation$(operation_num)$index config.data.util matches -1.. run scoreboard players remove operation$(operation_num)$index config.data.util 1

# Store the new index score in storage
$execute as @s if score operation$(operation_num)$tag_accurate config.data.util matches 1 run scoreboard players set @s config.data.linked_index $(index)
$execute as @s if score operation$(operation_num)$tag_accurate config.data.util matches 1 unless score operation$(operation_num)$size config.data.util matches 1 run scoreboard players add @s config.data.linked_index 1

$execute store result storage config.data:operations operation$(operation_num)."index" int 1 run scoreboard players get operation$(operation_num)$index config.data.util

# Execute a function with stored data
$execute as @s unless score operation$(operation_num)$tag_accurate config.data.util matches 1 unless score operation$(operation_num)$index config.data.util matches -2 run function config:util/func/check_tags with storage config.data:operations operation$(operation_num)

# Check if any of the tests pass?
$execute if score operation$(operation_num)$tag_accurate config.data.util matches 1 run return 1
$execute if score operation$(operation_num)$index config.data.util matches -2 run return fail