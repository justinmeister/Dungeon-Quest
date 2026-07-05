extends Player_state


func enter_state() -> void:
	name = c.HIT
	player.play_animation(c.HIT)
	player.velocity.x = -30
	GameState.player_health -= 1
	
	
func update(_delta: float) -> void:
	if player.animated_sprite.frame == 4:
		player.velocity.x = 0
	
	if !player.animation_player.is_playing():
		player.change_state(c.IDLE)
