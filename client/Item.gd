extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi()%3 ==1:
		$TextureRect.texture=load("res://potion.png")
	else:
		$TextureRect.texture=load("res://fist.png")

