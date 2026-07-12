extends Skeleton_State

var death_timer: Timer = Timer.new()

func enter_state() -> void:
	name = c.DIE
	skeleton.animation_player.play("death_right")
	skeleton.physics_collision_shape.disabled = true
	skeleton.audio_player.play()
	skeleton.sparks.emitting = true



func update(_delta: float):
	end_animation_check()

func end_animation_check() -> void:
	if !skeleton.animation_player.is_playing():
		skeleton.change_state(c.BONE_PILE)
	
