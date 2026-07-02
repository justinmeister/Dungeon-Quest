extends Player_state

var coyote_floating: bool = false

func enter_state():
	name = c.RUN
	player.animated_sprite.play(c.RUN)
	player.audio_player.stream = player.left_step_stream
	#player.audio_player.volume_db = -20.0
	#player.audio_player.play()


func update(_delta: float) -> void:
	if player.animated_sprite.get_frame() == 1:
		if !player.audio_player.playing:
			player.audio_player.play()
	elif player.animated_sprite.get_frame() == 6:
		if !player.audio_player.playing:
			player.audio_player.play()
	check_direction()
	player.velocity.x = move_toward(player.velocity.x, c.MAX_SPEED * player.direction, c.RUN_ACCEL)
	
	if !player.is_on_floor():
		coyote_time_check()
		
	elif player.direction == 0.0:
		player.velocity.x = move_toward(player.velocity.x, 0, c.MAX_SPEED)
		player.change_state(c.IDLE)
	
	if Input.is_action_just_pressed("up"):
		print(player.coyote_timer.time_left)
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
	
