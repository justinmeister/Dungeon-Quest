extends Player_state

class_name Jump_state



func enter_state():
	name = c.JUMP
	player.play_animation(c.JUMP_RIGHT, c.JUMP_LEFT)
	player.velocity.y = c.JUMP_VELOCITY
	player.audio_player.stream = player.swish
	player.audio_player.play()
	player.double_jump_buffer = true
	player.jump_buffer = false


func update(delta: float):
	buffer_jump_timer_check()
	player.velocity.x = player.direction * c.MAX_SPEED
	
	if player.is_on_floor():
		player.velocity.y = 0
		change_from_jump_state()
	else:
		if Input.is_action_just_pressed("ui_accept"):
			player.change_state(c.JUMP_ATTACK)
		elif Input.is_action_just_pressed("up"):
			buffer_jump_input()
			
		player.velocity += player.get_gravity() * delta
		

func buffer_jump_input() -> void:
	player.jump_buffer = true
	player.jump_buffer_timer.start(1.0)

func buffer_jump_timer_check() -> void:
	if player.jump_buffer_timer.time_left == 0:
		player.jump_buffer = false
