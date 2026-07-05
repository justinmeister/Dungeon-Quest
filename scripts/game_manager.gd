extends Node

@onready var heart1: NinePatchRect = $CanvasLayer/HUD/TextureRect/heart1
@onready var heart2: NinePatchRect = $CanvasLayer/HUD/TextureRect/heart2
@onready var heart3: NinePatchRect = $CanvasLayer/HUD/TextureRect/heart3


var player_health = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	update_player_health()
	
func update_player_health() -> void:
	player_health = GameState.player_health
	
	if player_health == 3:
		update_heart_alpha(1, 1, 1)
	elif player_health == 2:
		update_heart_alpha(1, 1, 0.25)
	elif player_health == 1:
		update_heart_alpha(1, 0.25, 0.25)
	elif player_health <= 0:
		update_heart_alpha(0.25, 0.25, 0.25)
	
func update_heart_alpha(value_1, value_2, value_3) -> void:
	heart1.modulate.a = value_1
	heart2.modulate.a = value_2
	heart3.modulate.a = value_3
