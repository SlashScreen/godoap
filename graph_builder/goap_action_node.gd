class_name GOAPActionNode
extends GOAPGraphNode


var action:GOAPAction


func _init(a:GOAPAction = null) -> void:
	action = a


func get_prerequisites() -> Array[GOAPCondition]:
	return action.get_prerequisites()


func get_effects() -> Array[GOAPEffect]:
	return action.get_effects()


func _to_string() -> String:
	return "GOAP Action: %s" % action.name
