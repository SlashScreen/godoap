class_name GOAPSolver
extends Node


static var world_state:Dictionary = {} 


static func plan(agent:GOAPAgent, graph:GOAPGraph, goal:GOAPGoalNode) -> Array[GOAPAction]:
	return Array(_astar(agent, goal, graph, world_state.merged(agent.world_state))\
		.filter(func(n:GOAPGraphNode) -> bool: return n is GOAPActionNode)\
		.map(func(n:GOAPActionNode) -> GOAPAction: return n.action), TYPE_OBJECT, &"Node", GOAPAction)


static func _astar(agent:GOAPAgent, start:GOAPGraphNode, graph:GOAPGraph, state:Dictionary) -> Array[GOAPGraphNode]:
	var path := {}
	var open_set:Array[GOAPGraphNode] = [start]
	
	var g_scores := {}
	g_scores[start] = 0
	var f_scores := {}
	f_scores[start] = _heuristics(start, state)
	
	while not open_set.is_empty():
		open_set.sort_custom(func(a:GOAPGraphNode, b:GOAPGraphNode) -> bool: return _heuristics(a, state) > _heuristics(b, state))
		var current:GOAPGraphNode = open_set.pop_back()
		if _executable(current, state):
			return _retrace_path(start, path)
		
		for n:GOAPGraphNode in current.neighbors:
			var tentative_g_score:float = g_scores[current] + current.position.distance_squared_to(n.position)
			if tentative_g_score < g_scores.get_or_add(n, 0.0):
				path[n] = current
				g_scores[n] = tentative_g_score
				f_scores[n] = tentative_g_score + _heuristics(n, state)
				if not n in open_set:
					open_set.append(n)
	
	return []


static func _heuristics(node:GOAPGraphNode, state:Dictionary) -> float:
	# TODO: Optimize.... somehow... 
	# loop through conditions
	# check if key in state
	# if so, add heuristic
	return node.get_prerequisites().reduce(func(accum:float, next:GOAPCondition) -> float:
		if state.has(next.key):
			return accum + next.heuristic(state[next.key])
		return accum
		, 0.0)


static func _executable(node:GOAPGraphNode, world_state:Dictionary) -> bool:
	return node.satisfied_by_state(world_state)


static func _retrace_path(start:GOAPGraphNode, path:Dictionary) -> Array[GOAPGraphNode]:
	var current := start 
	var res:Array[GOAPGraphNode] = []
	while path.has(current):
		res.append(current)
		current = path[current]
	return res
