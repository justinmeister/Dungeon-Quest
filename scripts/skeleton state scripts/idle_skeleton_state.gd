extends Skeleton_State

func enter_state():
	name = c.IDLE
	skeleton.animation_player.play(c.IDLE)

func update(_delta: float):
	if hit_by_player_sword():
		if skeleton.health > 0:
			skeleton.change_state(c.HURT)
		else:
			skeleton.change_state(c.DIE)
	elif skeleton.player_detected:
		skeleton.change_state(c.DOUBLE_ATTACK)
	
	
	
