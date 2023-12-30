execute store result score runningOperations$num config.data.util run data get storage config.data:operations Operations[]
scoreboard players remove runningOperations$num config.data.util 1
execute store result storage config.data:operations Operations[] int 1 run scoreboard players get runningOperations$num config.data.util