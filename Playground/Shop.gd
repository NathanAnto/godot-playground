extends Area2D

# Name of scene in PascalCase
export (String) var scene_name = "TemplateText (PascalCase)"

signal interact(scene_name);

onready var player = get_parent().get_node("Player");
var canInteract = false;

func _ready():
	$AnimationPlayer.play("main")

func _process(_delta):
	if canInteract and Input.is_action_just_pressed("interact"):
		print("interacting with " + scene_name + " shop")
		SignalManager.emit_signal("change_scene", "res://Scenes/"+scene_name+".tscn")
#		emit_signal("interact", scene_name);

func _on_shop_body_entered(body):
	if body.is_in_group("player"):
		connect("interact", player, "enter_shop_scene");
		canInteract = true;

func _on_shop_body_exited(body):
	if body.is_in_group("player"):
		canInteract = false;
		disconnect("interact", player, "enter_shop_scene");
