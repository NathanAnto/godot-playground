extends Node

# Path to the next scene to transition to
#export(String, FILE, "*.tscn") var next_scene_path
onready var current_level = $Playground;
onready var anim_player := $AnimationPlayer

var next_level = null;

func _ready():
	anim_player.play("fade_out");
	SignalManager.connect("change_scene", self, "change_scene");
	
func change_scene(next_level_name: String):
	print("Next level " + next_level_name);
	next_level = load("res://Scenes/" + next_level_name + ".tscn").instance();
	anim_player.play("fade_in");
	next_level.name = next_level_name;

func _on_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			current_level.cleanup(anim_player);
			current_level = next_level;
			add_child(current_level);
			next_level = null;
			anim_player.play("fade_out");
			current_level.on_scene_load()
