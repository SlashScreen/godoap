class_name GOAPActionNode
extends GOAPGraphNode


var action:GOAPAction


func _init(a:GOAPAction = null) -> void:
	action = a


func _get_conditions() -> Array[GOAPCondition]:
	return action.get_conditions()


func _get_effects() -> Array[GOAPEffect]:
	return action.get_effects()


func _to_string() -> String:
	return "GOAP Action: %s" % action.name
