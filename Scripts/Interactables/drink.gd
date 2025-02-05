extends Node2D

@export var drink_type:String

func _enter_tree() -> void:
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		if event.pressed:
			print(self.name)
		else:
			print("Drop")
	
