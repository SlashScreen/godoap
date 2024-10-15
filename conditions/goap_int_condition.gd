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
			return INF


func effect_works_towards(effect:GOAPEffect) -> bool:
	if effect is GOAPIntEffect:
		match condition:
			GREATER_THAN, GREATER_EQUAL_THAN:
				return effect.operation == GOAPIntEffect.INCREMENT
			LESS_THAN, LESS_EQUAL_THAN:
				return effect.operation == GOAPIntEffect.DECREMENT # TODO: Set AND set would put it in range
			_:
				return true 
	return false
