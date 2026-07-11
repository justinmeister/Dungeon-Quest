extends Player_state

### Constants to change state (IDLE, RUN, etc) are inherited
### from the Player_state class. 

func enter_state() -> void:
	name = c.FALL

func update(delta: float) -> void:
	player.velocity.x = player.direction * c.MAX_SPEED
	
	if player.is_on_floor():
		player.velocity.y = 0
		change_to_run_or_idle()
	else:
		player.velocity += player.get_gravity() * delta
	
