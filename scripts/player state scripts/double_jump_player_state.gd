extends Jump_state


func enter_state():
	name = c.DOUBLE_JUMP
	player.play_animation(c.DOUBLE_JUMP_RIGHT, c.DOUBLE_JUMP_LEFT)
	player.velocity.y = c.JUMP_VELOCITY
	player.audio_player.stream = player.swish
	player.audio_player.play()
	player.jump_buffer = false
