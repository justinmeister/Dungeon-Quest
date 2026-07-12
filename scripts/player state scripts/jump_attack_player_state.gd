extends Player_state



func enter_state():
	name = c.JUMP_ATTACK
	player.audio_player.stream = player.sword_slash_stream
	player.audio_player.play()
	player.play_animation(c.RIGHT_GROUND_ATTACK, c.LEFT_GROUND_ATTACK)
	
func update(delta: float) -> void:
	if hit_by_skeleton_sword():
		player.velocity.y = 0
		player.change_state(c.HIT_IN_AIR)
	
	elif player.is_on_floor():
		player.velocity.x = 0
		if !player.animation_player.is_playing():
			change_from_jump_state()
	else:
		player.velocity.x = player.direction * c.MAX_SPEED
		player.velocity += player.get_gravity() * delta
		
