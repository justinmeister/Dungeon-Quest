@abstract class_name Player_state

extends Object

var player: CharacterBody2D
var state_dict: Dictionary
var name: String

#const JUMP = Constants.JUMP
#const RUN = Constants.RUN
#const GROUND_ATTACK = Constants.GROUND_ATTACK
#const JUMP_ATTACK = Constants.JUMP_ATTACK
#const IDLE = Constants.IDLE
#const FALL = Constants.FALL
#const MAKE_BIG = Constants.MAKE_BIG
#const SWORD_COLLISION = Constants.SWORD_COLLISION

#const MAX_SPEED = Constants.MAX_SPEED
#const JUMP_VELOCITY = Constants.JUMP_VELOCITY
#const RUN_ACCEL = Constants.RUN_ACCEL

@abstract func update(delta: float)
@abstract func enter_state()

func _init(new_player = null):
	player = new_player
	enter_state()

func check_direction():
	player.direction = Input.get_axis("ui_left", "ui_right")
		
	if player.direction > 0:
		player.facing_right = true
		player.animated_sprite.flip_h = false
	elif player.direction < 0:
		player.facing_right = false
		player.animated_sprite.flip_h = true

func change_to_run_or_idle():
	if player.direction:
		player.change_state(c.RUN)
	else:
		player.change_state(c.IDLE)

func hit_by_skeleton_sword() -> bool:
	var area_collisions = player.hitbox.get_overlapping_areas()
	
	for collision in area_collisions:
		if collision.name == "skeleton_sword_hitbox":
			return true
	
	return false

	
	
