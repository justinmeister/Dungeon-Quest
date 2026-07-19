extends CharacterBody2D

var state
var state_dict
var initial_state = c.IDLE
var health = c.SKELETON_START_HEALTH
var player_detected = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var physics_collision_shape: CollisionShape2D = $CollisionShape2D
@onready var hitbox: Area2D = $hitbox
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	state_dict = make_state_dict()
	state = state_dict[initial_state].new(self)

### This makes a dictionary of states. It's used by the state classes to change state
### by making a new state object. Ex: player.state = state_dict[IDLE].new(player)

func make_state_dict() -> Dictionary:
	var new_state_dict = {c.IDLE: preload("res://scripts/little_skeleton_state_scripts/idle_little_skeleton_state.gd"),
						  c.DIE: preload("res://scripts/little_skeleton_state_scripts/die_little_skeleton_state.gd"),
						  c.BONE_PILE: preload("res://scripts/little_skeleton_state_scripts/bone_pile_little_skeleton_state.gd"),
						  c.ATTACK: preload("res://scripts/little_skeleton_state_scripts/attack_little_skeleton_state.gd")
				  		 }
	return new_state_dict


func _physics_process(delta: float) -> void:
	state.update(delta)
	move_and_slide()


func change_state(new_state: String):
	state = state_dict[new_state].new(self)
	

func _on_detect_enemy_area_2d_area_entered(_area: Area2D) -> void:
	print("entered")
	player_detected = true

func _on_detect_enemy_area_2d_area_exited(_area: Area2D) -> void:
	print("exited")
	player_detected = false
