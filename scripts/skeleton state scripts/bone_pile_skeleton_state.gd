extends Skeleton_State

var fade_away_tween: Tween
var smoke_tween: Tween


func enter_state() -> void:
	name = c.BONE_PILE
	skeleton.animated_sprite.play(c.BONE_PILE)
	skeleton.sword_shape.disabled = true
	fade_bones()

func update(_delta: float) -> void:
	pass

func fade_bones() -> void:
	fade_away_tween = skeleton.create_tween()
	fade_away_tween.tween_property(skeleton, "modulate:a", 0, 2).set_trans(Tween.TRANS_CUBIC)
	fade_away_tween.tween_callback(func delete_skeleton(): skeleton.queue_free() )
	

	
	
