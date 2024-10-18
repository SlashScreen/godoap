extends GOAPAction


func on_start(_agent:GOAPAgent, _data:GOAPData) -> void: 
	print("Test Action 3 started")


func _get_conditions() -> Array[GOAPCondition]:
	return [
		GOAPIntCondition.new(&"another_key", GOAPIntCondition.LESS_THAN, 10)
	]


func _get_effects() -> Array[GOAPEffect]:
	return [
		GOAPIntEffect.new(&"test_key", GOAPIntEffect.INCREMENT, 1)
	]


func get_cost(_agent:GOAPAgent) -> float:
	return 0.5
