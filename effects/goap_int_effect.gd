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
