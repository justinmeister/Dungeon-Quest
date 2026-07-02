extends Player_state

class_name Jump_state



func enter_state():
	name = c.JUMP
	player.animated_sprite.play(name)
	player.velocity.y = c.JUMP_VELOCITY
	player.audio_player.stream = player.swish
	player.audio_player.play()


func update(delta: float):
	check_direction()
	player.velocity.x = player.direction * c.MAX_SPEED
	
	if player.is_on_floor():
		player.velocity.y = 0
		change_to_run_or_idle()
	else:
		if Input.is_action_just_pressed("ui_accept"):
			player.change_state(c.JUMP_ATTACK)
		player.velocity += player.get_gravity() * delta
		
