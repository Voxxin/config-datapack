## Example how to make your own button configuration.
# Initialize a configuration with empty tags and actions for both RightClick and LeftClick.
data modify storage config.data:config Config append value {Self_tag: "", Common_tag: "", Action: {RightClick: [], LeftClick: []}}

# Customize the configuration: set Self_tag and Common_tag.
data modify storage config.data:config Config[-1].Self_tag set value "config.example_tag.self"
data modify storage config.data:config Config[-1].Common_tag set value "config.example_tag.common"

# Add actions for both RightClick and LeftClick with commands and arguments.
data modify storage config.data:config Config[-1].Action.RightClick append value {"command": "say right click example command 1", "arg": ""}
data modify storage config.data:config Config[-1].Action.RightClick append value {"command": "execute as @s at @s run summon firework_rocket ~ ~3 ~ {LifeTime: 0, FireworksItem: {id: 'minecraft:firework_rocket', Count: 1b, tag: {Fireworks: {Explosions: [{Type: 0b, Colors: [I; 16711680], Flicker: 1b, Trail: 1b}]}}}}", "arg": ""}
data modify storage config.data:config Config[-1].Action.LeftClick append value {"command": "say left click example command 1", "arg": ""}