extends Little_Skeleton_State


func enter_state() -> void:
	name = c.DIE
	skeleton.animation_player.play(c.DIE)
	skeleton.audio_player.play()

func update(_delta: float) -> void:
	if !skeleton.animation_player.is_playing():
		skeleton.change_state(c.BONE_PILE)
