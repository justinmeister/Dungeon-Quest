extends Player_state


func enter_state() -> void:
	name = c.IDLE
	player.play_animation(c.IDLE)

func update(_delta: float):
	player.velocity.x = move_toward(player.velocity.x, 0.0, c.RUN_ACCEL)
	check_direction()
	
	if hit_by_skeleton_sword():
		player.change_state(c.HIT)
	
	if Input.is_action_just_pressed("up"):
		player.change_state(c.JUMP)
	
	elif Input.is_action_just_pressed("big"):
		player.change_state(c.MAKE_BIG)
		
	elif player.direction:
		player.change_state(c.RUN)
		
	elif Input.is_action_just_pressed("ui_accept"):
		player.change_state(c.GROUND_ATTACK)
	
	elif !player.is_on_floor():
		player.change_state(c.FALL)

		
