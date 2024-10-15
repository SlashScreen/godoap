class_name GOAPGraphNode
extends Resource


var neighbors:Array[GOAPGraphNode]
var position:Vector3


func get_prerequisites() -> Array[GOAPCondition]:
	return []


func get_effects() -> Array[GOAPEffect]:
	return []


func is_satisfied(state:Dictionary) -> bool:
	return false


func satisfied_by_state(state:Dictionary) -> bool:
	return get_prerequisites().all(func(c:GOAPCondition) -> bool:
		print("State has key? %s" % state.has(c.key))
		if state.has(c.key):
			print("Satisfied? : %s" % c.satisfied_by(state[c.key]))
			return c.satisfied_by(state[c.key])
		else:
			return false
		)
