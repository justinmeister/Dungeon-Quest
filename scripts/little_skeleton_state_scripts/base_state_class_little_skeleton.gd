@abstract class_name Little_Skeleton_State

extends Object


var skeleton: CharacterBody2D
var name: String

@abstract func update(delta: float)
@abstract func enter_state()

func _init(new_skeleton = null):
	skeleton = new_skeleton
	enter_state()

func hit_by_player_sword() -> bool:
	var area_collisions = skeleton.hitbox.get_overlapping_areas()
	for collision in area_collisions:
		if collision.name == "player_sword_hitbox":
			return true

	return false
			
	
	
	
	
	
	
	
