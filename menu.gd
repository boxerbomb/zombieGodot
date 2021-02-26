extends Node2D
onready var global_vars = get_node("/root/GlobalVars")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	get_tree().quit()


func _on_Button2_pressed():
	print(global_vars.id)
	print(global_vars.url)
	get_tree().change_scene("res://Game.tscn")


func _on_LineEdit_text_changed(inID):
	global_vars.id=inID


func _on_LineEdit2_text_changed(inUrl):
	global_vars.url=inUrl
