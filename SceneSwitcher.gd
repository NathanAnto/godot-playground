extends ColorRect

# Path to the next scene to transition to
export(String, FILE, "*.tscn") var next_scene_path

# Reference to the _AnimationPlayer_ node
onready var anim_player := $AnimationPlayer

func _ready():
	anim_player.play("fade");
	SignalManager.connect("change_scene", self, "transition_to");
	
func transition_to(next_scene := next_scene_path):
	print("transitioning")
	anim_player.play_backwards("fade");
	yield(anim_player, "animation_finished");
	
	get_tree().change_scene(next_scene);
