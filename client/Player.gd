extends KinematicBody2D

export (int) var speed = 400
export (int) var id = 0

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		
	if Input.is_action_just_pressed('ui_inventory'):
		global.InventoryUp = not global.InventoryUp
		$Inventory/backpack.visible = not $Inventory/backpack.visible 
		
		
	velocity = velocity.normalized() * speed


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
