extends Node2D

var item_name
var item_quantity

func _ready():
	var rand_val = randi() % 3
	if rand_val == 0:
		item_name = "Fist"
	else:
		item_name = "Potion"
	
	# Set the image to item image
	$TextureRect.texture = load("res://Assets/item_icons/"+item_name+".png")
	
	# Find the maximun stack size and then choose a random value
	var max_stack_size = int(JSON_data.item_data[item_name]["StackSize"])
	item_quantity = randi() % max_stack_size +1
	
	# Non-stackable dont show label
	if max_stack_size == 1:
		$Label.visible = false
	else:
		#Item is stackable, update quantity
		$Label.text = String(item_quantity)
		
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func remove_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
	
	

