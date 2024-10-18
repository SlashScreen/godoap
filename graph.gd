extends Control


@onready var graph_edit: GraphEdit = $GraphEdit


func render(graph:GOAPGraph) -> void:
	var graph_nodes := {}
	
	for n:GOAPGraphNode in graph.nodes:
		var new_node := GraphNode.new()
		new_node.set_slot(0, true, 0, Color.WHITE, true, 0, Color.WHITE)
		new_node.title = str(n)
		new_node.add_child(Label.new())
		
		for c:GOAPCondition in n.get_conditions():
			var l := Label.new()
			l.text = str(c)
			new_node.add_child(l)
		
		if n.get_effects().size() > 0 and n.get_conditions().size() > 0:
			new_node.add_child(HSeparator.new())
		
		for e:GOAPEffect in n.get_effects():
			var l := Label.new()
			l.text = str(e)
			new_node.add_child(l)
		
		graph_nodes[n] = new_node
		graph_edit.add_child(new_node)
	
	for n:GOAPGraphNode in graph.nodes:
		var g_node:GraphNode = graph_nodes[n]
		for neighbor:GOAPGraphNode in n.neighbors:
			var n_node:GraphNode = graph_nodes[neighbor]
			graph_edit.connect_node(n_node.name, 0, g_node.name, 0)
		graph_edit.arrange_nodes()
