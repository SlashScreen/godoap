class_name GOAPGraph
extends RefCounted


var goals := {}
var nodes:Array[GOAPGraphNode]


#func build_astar() -> void:
	#var idx_map := {}
	#
	#for i:int in nodes.size():
		#var n := nodes[i]
		#idx_map[n] = i
		#if n is GOAPActionNode:
			#add_point(i, n.action.get_position())
		#elif n is GOAPGoalNode:
			#add_point(i, Vector3.ZERO)
	#
	#for n:GOAPGraphNode in nodes:
		#for c:GOAPGraphNode in n.neighbors:
			#connect_points(idx_map[n], idx_map[c], false)
