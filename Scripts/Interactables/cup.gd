extends Node2D

var region_size = Vector2(115, 96)
@export var region_position:Dictionary
var current_drink:String

var start_pos:Vector2
var picked_up:bool
var index:int

func _ready() -> void:
	start_pos = position
	index = get_z_index()

func change_drink( drink_name:String ):
	var pos = region_position.get("empty")
	
	if(drink_name == "milk"):
		current_drink += "_milk"
	else:
		current_drink = drink_name
	
	if(region_position.has(current_drink)):
		pos = region_position.get(current_drink)
		
	get_node("Sprite2D").region_rect = Rect2(pos[0], pos[1], region_size[0], region_size[1])

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
	
	
