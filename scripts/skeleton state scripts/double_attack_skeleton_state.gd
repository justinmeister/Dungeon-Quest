extends Skeleton_State


func enter_state() -> void:
	name = c.DOUBLE_ATTACK
	skeleton.animation_player.play(c.DOUBLE_ATTACK_LEFT)


### hit_by_player_check() checks if the player's sword hitbox
### is overlapping with the skeleton's body. It's defined in the 
## base skeleton state class -> base_state_class_skeleton.gd
func update (delta: float):
	if hit_by_player_sword():
		if skeleton.health > 0:
			skeleton.change_state(c.HURT)
		else:
			skeleton.change_state(c.DIE)
