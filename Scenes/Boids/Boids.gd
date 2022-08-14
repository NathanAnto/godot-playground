extends Scene

func cleanup(anim_player):
	print("Cleaning up boids")
	if anim_player.is_playing():
		yield(anim_player, "finished");
	queue_free();

func on_scene_load():
	pass

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		SignalManager.emit_signal("change_scene", "Playground");
