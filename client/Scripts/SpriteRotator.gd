extends Sprite

func _ready():
	pass # Replace with function body.


func _process(delta):
	look_at(get_global_mouse_position())
