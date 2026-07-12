extends CharacterBody2D

## String constants for Player states and animations


var state: Player_state
var direction: float
var state_dict: Dictionary
var initial_state = c.IDLE
var big = false
var facing_right = true
var jump_buffer: bool = false
var double_jump_buffer: bool = false



@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_sword_hitbox: Area2D = $player_sword_hitbox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sword_hitbox_shape: CollisionShape2D = $player_sword_hitbox/sword_collision_shape
@onready var coyote_timer: Timer = $coyote_timer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var hitbox: Area2D = $hitbox_player
@onready var double_jump_timer: Timer = $double_jump_timer
@onready var jump_buffer_timer: Timer = $jump_buffer_timer

var sword_slash_stream: AudioStream = preload("res://assets/SFX/sword_slash.mp3")
var left_step_stream: AudioStream = preload("res://assets/SFX/left_footstep.mp3")
var right_step_stream: AudioStream = preload("res://assets/SFX/right_footstep.mp3")
var ground_impact_stream: AudioStream = preload("res://assets/SFX/ground_impact.mp3")
var rustle_stream: AudioStream = preload("res://assets/SFX/cloth_rustle.mp3")
var swish: AudioStream = preload("res://assets/SFX/swish.mp3")


func _ready() -> void:
	state_dict = make_state_dict()
	state = state_dict[initial_state].new(self)

### This makes a dictionary of states. It's used by the state classes to change state
### by making a new state object. Ex: player.state = state_dict[IDLE].new(player)

func make_state_dict() -> Dictionary:
	
	var new_state_dict = {c.IDLE: preload("res://scripts/player state scripts/idle_player_state.gd"),
			  	  c.JUMP: preload("res://scripts/player state scripts/jump_player_state.gd"),
				  c.DOUBLE_JUMP: preload("res://scripts/player state scripts/double_jump_player_state.gd"),
				  c.RUN: preload("res://scripts/player state scripts/run_player_state.gd"),
				  c.FALL: preload("res://scripts/player state scripts/fall_player_state.gd"),
				  c.GROUND_ATTACK: preload("res://scripts/player state scripts/ground_attack_player_state.gd"),
				  c.JUMP_ATTACK: preload("res://scripts/player state scripts/jump_attack_player_state.gd"),
				  c.MAKE_BIG: preload("res://scripts/player state scripts/make_big_player_state.gd"),
				  c.HIT: preload("res://scripts/player state scripts/hit_player_state.gd")}
	
	return new_state_dict
	

### Most of the logic around player movement / attacks are handled in the state
### classes. Every state object has an update() function that will check for input,
### adjust velocity, and potentially change state (RUN, JUMP, IDLE, etc.). The 
### player.state object will get changed to a new state object. move_and_slide() is 
### just a default collision function for CharacterBody2D nodes.

func _physics_process(delta: float) -> void:
	check_direction()
	state.update(delta)
	move_and_slide()

func change_state(new_state: String):
	state = state_dict[new_state].new(self)

func play_animation(normal_animation: String, flipped_animation: String = "none"):
	if flipped_animation != "none":
		if facing_right:
			animation_player.play(normal_animation)
		else:
			animation_player.play(flipped_animation)
	else:
		animation_player.play(normal_animation)

func check_direction():
	direction = Input.get_axis("ui_left", "ui_right")
		
	if direction > 0:
		facing_right = true
	elif direction < 0:
		facing_right = false
	
