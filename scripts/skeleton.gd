extends CharacterBody2D

var state
var state_dict
var initial_state = c.IDLE
var health = c.SKELETON_START_HEALTH
var player_detected: bool = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Area2D = $hitbox
@onready var physics_collision_shape: CollisionShape2D = $physics_shape2D
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sword_shape: CollisionShape2D = $skeleton_sword_hitbox/sword_shape
@onready var sparks: CPUParticles2D = $sparks/CPUParticles2D


func _ready() -> void:
	state_dict = make_state_dict()
	state = state_dict[initial_state].new(self)

### This makes a dictionary of states. It's used by the state classes to change state
### by making a new state object. Ex: player.state = state_dict[IDLE].new(player)

func make_state_dict() -> Dictionary:
	var new_state_dict = {c.IDLE: load("res://scripts/skeleton state scripts/idle_skeleton_state.gd"),
				  		  c.WALK: load("res://scripts/skeleton state scripts/walk_skeleton_state.gd"),
				  		  c.ATTACK1: load("res://scripts/skeleton state scripts/attack1_skeleton_state.gd"),
				  		  c.ATTACK2: load("res://scripts/skeleton state scripts/attack2_skeleton_state.gd"),
				  		  c.DIE: load("res://scripts/skeleton state scripts/die_skeleton_state.gd"),
				  		  c.HURT: load("res://scripts/skeleton state scripts/hurt_skeleton_state.gd"),
						  c.STAND_UP: load("res://scripts/skeleton state scripts/stand_up_skeleton_state.gd"),
						  c.BONE_PILE: load("res://scripts/skeleton state scripts/bone_pile_skeleton_state.gd"),
						  c.DOUBLE_ATTACK: load("res://scripts/skeleton state scripts/double_attack_skeleton_state.gd")
				  		 }
	
	return new_state_dict


func _physics_process(delta: float) -> void:
	state.update(delta)
	move_and_slide()

func change_state(new_state: String):
	state = state_dict[new_state].new(self)

func _on_player_detect_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "hitbox_player":
		print("entered")
		player_detected = true

func _on_player_detect_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "hitbox_player":
		print("exited")
		player_detected = false
