extends Little_Skeleton_State

var transition_to_idle = false

func enter_state() -> void:
	name = c.ATTACK
	skeleton.animation_player.play(c.ATTACK)


func update(_delta: float) -> void:
	if transition_to_idle:
		if skeleton.animated_sprite.frame == 17:
			skeleton.change_state(c.IDLE)
	else:
		if hit_by_player_sword():
			skeleton.change_state(c.DIE)
		elif !skeleton.player_detected:
			transition_to_idle = true
