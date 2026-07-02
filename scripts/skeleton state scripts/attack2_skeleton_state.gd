extends Skeleton_State

func enter_state() -> void:
	name = c.ATTACK2
	skeleton.animated_sprite.play(name)

func update(_delta: float):
	end_animation_check()

func end_animation_check() -> void:
	if !skeleton.animated_sprite.is_playing():
		skeleton.change_state(c.IDLE)
