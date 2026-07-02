extends Node

@onready var current_level = $Level1

const LEVEL_2_PATH = "res://scenes/levels/level_2.tscn"

var level_2_packed_scene = preload(LEVEL_2_PATH)
var level_list = [LEVEL_2_PATH]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	change_level_check()
	
	
func change_level_check() -> void:
	if current_level:
		if current_level.change_level:
			current_level.queue_free()
			if level_list.size() > 1:
				current_level = load(level_list.pop_front()).instantiate()
			else:
				current_level = load(level_list[0]).instantiate()
			add_child(current_level)


	
		
			
