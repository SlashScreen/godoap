class_name GOAPIntCondition
extends GOAPCondition


enum {
	EQUAL,
	GREATER_THAN,
	GREATER_EQUAL_THAN,
	LESS_THAN,
	LESS_EQUAL_THAN,
}


var condition:int
var value:int


func _init(k:StringName = &"", c:int = EQUAL, v:int = 0) -> void:
	key = k
	condition = c 
	value = v


func heuristic(h_value:Variant) -> Variant:
	match condition:
		EQUAL:
			return abs(h_value - value)
		GREATER_THAN:
			return clamp((value - h_value) + 1, 0, INF)
		GREATER_EQUAL_THAN:
			return clamp(value - h_value, 0, INF)
		LESS_THAN:
			return clamp((h_value - value) + 1, 0, INF)
		LESS_EQUAL_THAN:
			return clamp(h_value - value, 0, INF)
		_: # unreachable
			push_error("girl what")
			return INF


func effect_works_towards(effect:GOAPEffect) -> bool:
	if effect is GOAPIntEffect:
		match condition:
			GREATER_THAN, GREATER_EQUAL_THAN:
				return effect.operation == GOAPIntEffect.INCREMENT
			LESS_THAN, LESS_EQUAL_THAN:
				return effect.operation == GOAPIntEffect.DECREMENT
			EQUAL:
				if effect.operation == GOAPIntEffect.SET:
					return effect.value == value
				else:
					return true
			_:
				return true 
	return false


func satisfied_by(v:Variant) -> bool:
	if not v is int:
		return false 
	
	match condition:
		EQUAL:
			return v == value
		GREATER_THAN:
			return v > value
		GREATER_EQUAL_THAN:
			return v >= value
		LESS_THAN:
			return v < value
		LESS_EQUAL_THAN:
			return v <= value
		_: # unreachable
			push_error("girl what")
			return false


func _to_string() -> String:
	var op := ""
	match condition:
		EQUAL:
			op = "=="
		GREATER_THAN:
			op = ">"
		GREATER_EQUAL_THAN:
			op = ">="
		LESS_THAN:
			op = "<"
		LESS_EQUAL_THAN:
			op = "<="
	
	return "Condition: %s %s %d" %[key, op, value]
