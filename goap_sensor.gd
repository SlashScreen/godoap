class_name GOAPSensor
extends Node

## This is the sensor node, so that you can change world or agent values.
## Note: You can use process as well.


enum {
	GLOBAL, ## Gives information for all agents
	LOCAL, ## Gives information to one agent
}


## Get sensor type.
func get_type() -> int:
	return LOCAL


## Get the current value.
func sense(_agent: GOAPAgent) -> int:
	return 0
