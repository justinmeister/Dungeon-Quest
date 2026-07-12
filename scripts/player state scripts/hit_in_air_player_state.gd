extends Player_state


func enter_state() -> void:
	name = c.HIT_IN_AIR
	player.play_animation(c.HIT)
	player.velocity.x = -30
	player.velocity.y = 0
	GameState.player_health -= 1
	
	
func update(delta: float) -> void:
	player.velocity += player.get_gravity() * delta
	print(player.velocity.y)
	
	if player.animated_sprite.frame == 4:
		player.velocity.x = 0
	
	if player.is_on_floor():
		if !player.animation_player.is_playing():
			player.change_state(c.IDLE)
