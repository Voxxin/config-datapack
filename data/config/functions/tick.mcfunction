execute as @e[type=interaction] if entity @s[nbt={interaction:{}}] run function config:util/analyse
execute as @e[type=interaction] if entity @s[nbt={attack:{}}] run function config:util/analyse