class_name GOAPAgent
extends Node


var world_state:Dictionary = {} ## StringName => Variant
var position:Vector3


func _ready() -> void:
	_test_basic_path()
	print("-----")
	_test_world_state()


func set_world_state(key:StringName, value:Variant) -> void: 
	world_state[key] = value


func _test_basic_path() -> void:
	print("Test Basic Path")
	world_state.clear()
	var graph := GOAPGraphBuilder.build_graph(get_children())
	print("Graph: ", graph.nodes)
	%Graph.render(graph)
	var path := GOAPSolver.plan(self, graph, graph.goals.keys()[0])
	print("Path: ", path)


func _test_world_state() -> void:
	print("Test World State")
	world_state.clear()
	set_world_state(&"another_key", 3)
	var graph := GOAPGraphBuilder.build_graph(get_children())
	print("Graph: ", graph.nodes)
	var path := GOAPSolver.plan(self, graph, graph.goals.keys()[0])
	print("Path: ", path)
