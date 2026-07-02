extends Skeleton_State

func enter_state() -> void:
	name = c.HURT
	skeleton.animation_player.play(name)
	skeleton.health -= 1

func update(_delta: float):
	end_animation_check()

func end_animation_check() -> void:
	if !skeleton.animation_player.is_playing():
		skeleton.change_state(c.DOUBLE_ATTACK)
