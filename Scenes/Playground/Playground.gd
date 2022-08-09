extends Scene

func cleanup(anim_player):
	print("Cleaning up playground")
	if anim_player.is_playing():
		yield(anim_player, "finished");
	queue_free();

func on_scene_load():
	pass
