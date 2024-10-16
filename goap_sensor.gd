class_name GOAPSensor
extends Node

## This is the sensor node, so that you can change world or agent values.
## Note: You can use process as well.


enum {
	GLOBAL, ## Gives information for all agents
	LOCAL, ## Gives information to one agent
}


@export var agent:GOAPAgent


## Get sensor type.
func get_type() -> int:
	return LOCAL


## Get the current value.
func get_sensor_value() -> int:
	return 0


func get_key() -> StringName:
	return &""


## Send the sensor value to the respective world state. If [method get_type] is [enum LOCAL], it will send it to [member agent], otherwise it will send it to [class GOAPSolver]. 
func sense() -> void:
	match get_type():
		LOCAL:
			agent.set_world_state(get_key(), get_sensor_value())
		GLOBAL:
			GOAPSolver.set_world_state(get_key(), get_sensor_value())
