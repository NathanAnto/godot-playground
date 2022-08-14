extends KinematicBody2D

export (int) var SPEED = 200;
export (int) var GRAVITY = 10;
export (int) var JUMP_FORCE = -50;

onready var anim_player = $AnimationPlayer

var velocity = Vector2();
var jumped = false;

func _physics_process(_delta):
	var x = Input.get_axis("left", "right");
	velocity.x = x * SPEED;
	
	velocity.y += GRAVITY;
	
	if is_on_floor():
		jumped = false;
		if Input.is_action_just_pressed("jump"):
			velocity.y += JUMP_FORCE
		if velocity.x != 0:
			$AnimatedSprite.scale.x = clamp(velocity.x, -1, 1)
			anim_player.play("move");
		else:
			anim_player.play("idle");
	else:		
		if velocity.y > 0:
			anim_player.play("fall");
		elif not jumped:
			anim_player.play("jump");
			jumped = true;
		
	velocity = move_and_slide(velocity, Vector2.UP);
	velocity.x = lerp(velocity.x, 0, 0.2);

func enter_shop_scene(scene_name):
	print("entering shop " + scene_name)
