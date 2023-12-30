# Clear and add the required scoreboard objectives
scoreboard players reset * config.data.util
scoreboard players reset * config.data.linked_index
scoreboard objectives add config.data.util dummy
scoreboard objectives add config.data.linked_index dummy

# Clear operation tags
tag @e remove config.data.in_operation
tag @e remove config.data.start_operation

# Make invalid option for fail-safe
scoreboard players set operation-1$assigned config.data.util -100

data remove storage config.data:operations availableOperations
data remove storage config.data:operations Operations
data remove storage config.data:operations emptyCompound

data merge storage config.data:operations {Operations:{}}
data merge storage config.data:operations {emptyCompound:[]}
# data merge storage config.data:operations {replaceableChars:['\\']}
# data merge storage config.data:operations replaceableChars[0] 
