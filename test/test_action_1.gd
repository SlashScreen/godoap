extends GOAPAction


func on_start(_agent: GOAPAgent, _data: GOAPData) -> void: 
	print("Test Action 1 started")


func get_effects() -> Array[GOAPEffect]:
	return [
		GOAPIntEffect.new(&"test_key", GOAPIntEffect.INCREMENT, 1)
	]
