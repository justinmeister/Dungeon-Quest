extends Player_state

func enter_state() -> void:
	name = c.GROUND_ATTACK
	player.audio_player.stream = player.sword_slash_stream
	#player.audio_player.volume_db = -2.0
	player.audio_player.play()
	if player.facing_right:
		player.animation_player.play("right_ground_attack")
	else:
		player.animation_player.play("left_ground_attack")
	


func update(_delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0.0, c.RUN_ACCEL)
	if !player.animated_sprite.is_playing():
		change_to_run_or_idle()
