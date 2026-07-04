extends Player_state

func enter_state() -> void:
	name = c.GROUND_ATTACK
	player.audio_player.stream = player.sword_slash_stream
	#player.audio_player.volume_db = -2.0
	player.audio_player.play()
	player.play_animation(c.RIGHT_GROUND_ATTACK, c.LEFT_GROUND_ATTACK)
	


func update(_delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0.0, c.RUN_ACCEL)
	if !player.animation_player.is_playing():
		change_to_run_or_idle()
