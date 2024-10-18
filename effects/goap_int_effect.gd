class_name GOAPIntEffect
extends GOAPEffect


enum {
	INCREMENT,
	DECREMENT,
	SET,
}


var operation:int
var value:int = 1


func _init(k:StringName = &"", op:int = INCREMENT, v:int = 1) -> void:
	key = k
	operation = op 
	value = v


func _to_string() -> String:
	var op := ""
	match operation:
		INCREMENT:
			op = "+="
		DECREMENT:
			op = "-="
		SET:
			op = "="
	
	return "Effect: %s %s %d" %[key, op, value]
