class_name GOAPGraphNode
extends Resource


var neighbors:Array[GOAPGraphNode]
var position:Vector3
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


func get_conditions() -> Array[GOAPCondition]:
	return _conditions


func _get_conditions() -> Array[GOAPCondition]:
	return []


func get_effects() -> Array[GOAPEffect]:
	return _effects


func _get_effects() -> Array[GOAPEffect]:
	return []


func is_satisfied(state:Dictionary) -> bool:
	return false


func satisfied_by_state(state:Dictionary) -> bool:
	for c:GOAPCondition in get_conditions():
		if state.has(c.key):
			if not c.satisfied_by(state[c.key]):
				return false
		else:
			return false
	return true
