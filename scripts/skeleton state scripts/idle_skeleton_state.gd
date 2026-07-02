extends Skeleton_State

const ATTACK_WEIGHT_TIME = 3

func enter_state():
	var weight_time = randf_range(1.0, 4.0)
	name = c.IDLE
	skeleton.animated_sprite.play(name)
	skeleton.attack_timer.start(weight_time)

func update(_delta: float):
	if hit_by_player_sword():
		if skeleton.health > 0:
			skeleton.change_state(c.HURT)
		else:
			skeleton.change_state(c.DIE)
	
	
	
