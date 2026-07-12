extends Player_state

var make_big_tween: Tween

func enter_state():
	name = c.MAKE_BIG
	player.big = true
	player.play_animation(c.IDLE_RIGHT, c.IDLE_LEFT)
	
func update(_delta):
	if !make_big_tween:
		make_big_tween = player.create_tween()
		make_big_tween.set_parallel(true)
		make_big_tween.tween_property(player, "scale", Vector2(2.0,2.0), 1).set_trans(Tween.TRANS_ELASTIC)
		make_big_tween.tween_property(player, "modulate", Color.RED, 1).set_trans(Tween.TRANS_ELASTIC)
		make_big_tween.chain().tween_property(player, "modulate", Color.WHITE, 0.25).set_trans(Tween.TRANS_SINE)
		make_big_tween.chain().tween_callback(modulate_tween_callback)
	
	
			
		
func modulate_tween_callback():
	var modulate_color_tween = player.create_tween()
	#modulate_color_tween.set_parallel(false)
	modulate_color_tween.set_loops(5)
	modulate_color_tween.tween_property(player, "modulate", Color.RED, 0.1).set_trans(Tween.TRANS_SINE)
	modulate_color_tween.tween_property(player, "modulate", Color.WHITE, 0.1).set_trans(Tween.TRANS_SINE)
	modulate_color_tween.finished.connect(change_state_callback)

func change_state_callback():
	player.change_state(c.IDLE)
	
	
	
	
	
	
	
	
	
	
