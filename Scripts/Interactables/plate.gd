extends Node2D

var start_pos:Vector2
var picked_up:bool
var index:int

func _ready() -> void:
	start_pos = position
	index = get_z_index()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			picked_up = true
			self.set_z_index(10)
		if event.is_released():
			picked_up = false
			self.set_z_index(index)
			position = start_pos


func _process(delta: float) -> void:
	if(picked_up):
		position = get_viewport().get_mouse_position()
