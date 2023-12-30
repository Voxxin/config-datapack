# This will return the operation number to run the operations on.
execute store result score operation$RunningNum config.data.util run data get storage config.data:operations availableOperations
scoreboard players add operation$RunningNum config.data.util 1
execute store result storage config.data:operations Operations.num int 1 run scoreboard players get operation$RunningNum config.data.util
function config:util/func/create_operation_pway0 with storage config.data:operations Operations