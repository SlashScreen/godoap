class_name GOAPCondition
extends RefCounted


var key:StringName


func heuristic(_value:Variant) -> Variant:
	return INF


func satisfied_by(_value:Variant) -> bool:
	return true 


func effect_works_towards(_effect:GOAPEffect) -> bool:
	return true
