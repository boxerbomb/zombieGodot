extends Node2D

const SlotClass = preload("res://Classes/Slot.gd")
onready var hotbar_slots = $hotbar
onready var backpack_slots = $backpack

const item_size = 63

var holding_item = null

func _ready():
	# Connect the gui_input functions to the slot_gui_functions available in this script
	for inv_slot in hotbar_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
		
	for inv_slot in backpack_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
		
func slot_gui_input(event: InputEvent, slot: SlotClass):
	# This function is called when a slot is clicked.
	# The slot clicked is refered to as 'slot'
	if event is InputEventMouseButton:
		# Check for a click and if it is a backpack slot, make sure backpack is showing
		if event.button_index == BUTTON_LEFT && event.pressed && (slot.isBackpack==false or global.InventoryUp==true):
			# Check if we are holding an item
			if holding_item != null:
				# item is being held
				if !slot.item:
					# Slot clicked on has no item
					slot.putIntoSlot(holding_item)
					holding_item=null
				elif holding_item.item_name != slot.item.item_name or int(JSON_data.item_data[slot.item.item_name]["StackSize"])==slot.item.item_quantity:
					# Slot being clicked on is not the same item so swap item
					# This also happens when it is the same item but the stack is completely full
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = get_global_mouse_position()-Vector2(60,0)
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
				else:
					# Items are the same so decide how much can be added
					var max_stack_size = int(JSON_data.item_data[slot.item.item_name]["StackSize"])
					var able_to_add = max_stack_size - slot.item.item_quantity
					
					# Check it see if the entire held item goes into the stack 
					if able_to_add >= holding_item.item_quantity:
						# If entire stack is added, delete the stack in the hand and add
						slot.item.add_item_quantity(holding_item.item_quantity)
						holding_item.queue_free()
						holding_item = null
					else:
						# If not the entire, add the stack and then subtract from
						slot.item.add_item_quantity(able_to_add)
						holding_item.remove_item_quantity(able_to_add)
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position.x = get_global_mouse_position().x - (item_size/2)
				holding_item.global_position.y = get_global_mouse_position().y - (item_size/2)
				
func _input(event):
	if holding_item:
		holding_item.global_position.x = get_global_mouse_position().x - (item_size/2)
		holding_item.global_position.y = get_global_mouse_position().y - (item_size/2)
	# Change active slot	
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_1:
			global.activeHotbarSlot=1
		elif event.scancode == KEY_2:
			global.activeHotbarSlot = 2
		elif event.scancode == KEY_3:
			global.activeHotbarSlot = 3
		elif event.scancode == KEY_4:
			global.activeHotbarSlot = 4
		elif event.scancode == KEY_5:
			global.activeHotbarSlot = 5
		elif event.scancode == KEY_6:
			global.activeHotbarSlot = 6
		elif event.scancode == KEY_7:
			global.activeHotbarSlot = 7
		elif event.scancode == KEY_8:
			global.activeHotbarSlot = 8
		elif event.scancode == KEY_9:
			global.activeHotbarSlot = 9