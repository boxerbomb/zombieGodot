extends KinematicBody2D

export (int) var speed = 200
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
	if Input.is_action_just_pressed("ui_inventory"):
		$InventoryComponent.toggle_window(self)
		$Hotbar.toggle_window(self)
		
	velocity = velocity.normalized() * speed

func _init():
	pass

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
