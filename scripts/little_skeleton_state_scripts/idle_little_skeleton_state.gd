extends Little_Skeleton_State


func enter_state() -> void:
	name = c.IDLE
	skeleton.animation_player.play(c.IDLE)


func update(_delta: float) -> void:
	if hit_by_player_sword():
		skeleton.change_state(c.DIE)
	elif skeleton.player_detected:
		skeleton.change_state(c.ATTACK)
		
