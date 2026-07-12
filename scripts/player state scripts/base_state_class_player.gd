@abstract class_name Player_state

extends Object

var player: CharacterBody2D
var state_dict: Dictionary
var name: String

@abstract func update(delta: float)
@abstract func enter_state()

func _init(new_player = null):
	player = new_player
	enter_state()

func change_from_jump_state():
	if player.jump_buffer:
		if player.state.name == c.DOUBLE_JUMP:
			player.change_state(c.JUMP)
		else:
			player.change_state(c.DOUBLE_JUMP)
	elif player.direction:
		player.change_state(c.RUN)
	else:
		player.change_state(c.IDLE)

func hit_by_skeleton_sword() -> bool:
	var area_collisions = player.hitbox.get_overlapping_areas()
	
	for collision in area_collisions:
		if collision.name == "skeleton_sword_hitbox":
			return true
	
	return false


func change_to_jump_state() -> void:
	if !player.double_jump_buffer:
		player.change_state(c.JUMP)
	else:
		if player.double_jump_timer.time_left > 0:
			player.change_state(c.DOUBLE_JUMP)
		else:
			player.change_state(c.JUMP)
		player.double_jump_buffer = false
	
