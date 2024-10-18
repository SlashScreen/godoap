class_name GOAPGoal
extends Node


var _conditions:Array[GOAPCondition]:
	get:
		if _conditions.is_empty():
			_conditions = _get_conditions()
		return _conditions


func get_conditions() -> Array[GOAPCondition]:
	return _conditions


func _get_conditions() -> Array[GOAPCondition]:
	return []
