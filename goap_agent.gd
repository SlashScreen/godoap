class_name GOAPAgent
extends Node


var world_state:Dictionary = {} ## StringName => Integer
var position:Vector3


func _ready() -> void:
	var graph := GOAPGraphBuilder.build_graph(get_children())
	print("Graph: ", graph.nodes)
	var path := GOAPSolver.plan(self, graph, graph.goals.keys()[0])
	print("Path: ", path)
