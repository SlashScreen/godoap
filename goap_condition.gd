class_name GOAPCondition
extends RefCounted


var key:StringName


func heuristic(value:Variant) -> Variant:
	return INF


func satisfied_by(value:Variant) -> bool:
	return true 


func effect_works_towards(effect:GOAPEffect) -> bool:
	return true
