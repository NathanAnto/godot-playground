extends Sprite

# only used if sign isn't in shop
export (String) var lbl_text = "template text"

func _ready():
	# if the sign is in a shop
	if get_parent().has_signal("interact"):
		# convert the scene name to text and set the sign label
		$Label.text = pascal_to_text(get_parent().scene_name);
	else:
		$Label.text = lbl_text;

func pascal_to_text(pascal: String):
	var res = "";
	for c in pascal:
		if c == c.to_upper() and c != pascal[0]:
			res += " " + c.to_lower();
		else:
			res += c;
	return res
