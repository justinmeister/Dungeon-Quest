extends Player_state




func enter_state() -> void:
	name = c.FALL

func update(delta: float) -> void:
	player.velocity.x = player.direction * c.MAX_SPEED
	
	if hit_by_skeleton_sword():
		player.velocity.y = 0
		player.change_state(c.HIT_IN_AIR)
		
	elif player.is_on_floor():
		player.velocity.y = 0
		change_from_jump_state()
	else:
		player.velocity += player.get_gravity() * delta
	
