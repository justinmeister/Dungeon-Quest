extends Node

var change_level = false
var need_level = true

@onready var music_player: AudioStreamPlayer = $AudioStreamPlayer 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_change_level_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		change_level = true
