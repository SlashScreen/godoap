extends GOAPGoal


func get_conditions() -> Array[GOAPCondition]:
	return [
		GOAPIntCondition.new(&"test_key", GOAPIntCondition.GREATER_THAN, 0)
	]
