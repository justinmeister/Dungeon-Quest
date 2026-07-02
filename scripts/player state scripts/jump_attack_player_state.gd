extends Player_state


func enter_state():
	name = c.JUMP_ATTACK
	player.audio_player.stream = player.sword_slash_stream
	player.audio_player.play()
	if player.facing_right:
		player.animation_player.play("right_ground_attack")
	else:
		player.animation_player.play("left_ground_attack")
	
func update(delta: float) -> void:
	check_direction()	
	if player.is_on_floor():
		player.velocity.x = 0
		if !player.animated_sprite.is_playing():
			change_to_run_or_idle()
	else:
		player.velocity.x = player.direction * c.MAX_SPEED
		player.velocity += player.get_gravity() * delta
		
