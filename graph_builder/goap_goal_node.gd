class_name GOAPGoalNode
extends GOAPGraphNode


var goal:GOAPGoal


func _init(g:GOAPGoal) -> void:
	goal = g


func get_prerequisites() -> Array[GOAPCondition]:
	return goal.get_conditions()


func _to_string() -> String:
	return "GOAP Action: %s" % goal.name
