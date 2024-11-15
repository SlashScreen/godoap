class_name GOAPAction
extends Node


static var config: GOAPConfig
var _conditions:Array[GOAPCondition]:
	get:
		if _conditions.is_empty():
			_conditions = _get_conditions()
		return _conditions
var _effects:Array[GOAPEffect]:
	get:
		if _effects.is_empty():
			_effects = _get_effects()
		return _effects

func get_cost(_agent: GOAPAgent) -> float:
	return 1.0


## Returns whether an action is in range or not. Called every frame while [method on_perform] is running.
## Can be overridden to perform, say, line of sight checks.
func is_in_range(_agent: GOAPAgent, agent_range:float, _data: GOAPData) -> bool:
	return agent_range <= config.range 


## Called when the action starts.
func on_start(_agent: GOAPAgent, _data: GOAPData) -> void: 
	pass 


## Called every frame the action is being performed.
func on_perform(_agent: GOAPAgent, _data: GOAPData, _delta: float) -> ActionState: 
	return ActionState.STOP


## Called when the action finishes.
func on_end(_agent: GOAPAgent, _data: GOAPData) -> void:
	pass


func get_conditions() -> Array[GOAPCondition]:
	return _conditions


func _get_conditions() -> Array[GOAPCondition]:
	return []


func get_effects() -> Array[GOAPEffect]:
	return _effects


func _get_effects() -> Array[GOAPEffect]:
	return []


func get_position() -> Vector3:
	return Vector3.ZERO


enum ActionState {
	CONTINUE,
	STOP,
}
