extends GOAPGoal


func _get_conditions() -> Array[GOAPCondition]:
	return [
		GOAPIntCondition.new(&"test_key", GOAPIntCondition.GREATER_THAN, 3)
	]
