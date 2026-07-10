extends Little_Skeleton_State


func enter_state() -> void:
	name = c.DIE
	skeleton.animation_player.play(c.DIE)

func update(_delta: float) -> void:
	if !skeleton.animation_player.is_playing():
		skeleton.queue_free()
