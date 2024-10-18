class_name GOAPGraphBuilder
extends RefCounted


static func build_graph(actions:Array[Node]) -> GOAPGraph:
	var nodes:Array[GOAPGraphNode] = Array(actions.map(func(n:Node) -> GOAPGraphNode: 
		if n is GOAPAction:
			return _action_to_node(n)
		else:
			return _goal_to_node(n)
			), TYPE_OBJECT, &"Resource", GOAPGraphNode)
	var effect_map := {}
	var goals := {}
	
	for n:GOAPGraphNode in nodes:
		if n is GOAPGoalNode:
			goals[n] = true
		
		for e:GOAPEffect in n.get_effects():
			effect_map.get_or_add(e.key, []).append([n, e])
	
	for n:GOAPGraphNode in nodes:
		for c:GOAPCondition in n.get_conditions(): # for each prerequisite
			for e_packet:Array in effect_map.get_or_add(c.key, []): # for all that have that effect
				var e_node:GOAPGraphNode = e_packet[0]
				var e_effect:GOAPEffect = e_packet[1]
				if c.effect_works_towards(e_effect):
					n.neighbors.append(e_node)
	
	var graph := GOAPGraph.new() 
	graph.nodes = nodes
	graph.goals = goals 
	return graph


static func _action_to_node(action:GOAPAction) -> GOAPGraphNode:
	return GOAPActionNode.new(action)


static func _goal_to_node(goal:GOAPGoal) -> GOAPGraphNode:
	return GOAPGoalNode.new(goal)
