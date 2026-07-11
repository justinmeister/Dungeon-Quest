extends Player_state

var coyote_floating: bool = false

func enter_state():
	name = c.RUN
	player.play_animation(c.RUN_RIGHT, c.RUN_LEFT)

func update(_delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, c.MAX_SPEED * player.direction, c.RUN_ACCEL)
	
	if !player.is_on_floor():
		coyote_time_check()
		
	elif player.direction == 0.0:
		player.velocity.x = move_toward(player.velocity.x, 0, c.MAX_SPEED)
		player.change_state(c.IDLE)
	
	if Input.is_action_just_pressed("up"):
		player.change_state(c.JUMP)
	elif Input.is_action_just_pressed("ui_accept"):
		player.change_state(c.GROUND_ATTACK)


func coyote_time_check() -> void:
	if coyote_floating:
		if player.coyote_timer.is_stopped():
			player.change_state(c.FALL)
	else:
		coyote_floating = true
		player.coyote_timer.start(0.1)
	
