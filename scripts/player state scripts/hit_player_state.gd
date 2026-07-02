extends Player_state


func enter_state() -> void:
	name = c.HIT
	player.animation_player.play(name)
	player.velocity.x = -30
	
	

func update(_delta: float) -> void:
	if !player.animation_player.is_playing():
		player.change_state(c.IDLE)
