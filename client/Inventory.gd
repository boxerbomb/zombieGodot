extends Node2D

const SlotClass = preload("res://Slot.gd")
onready var hotbar_slots = $hotbar
onready var backpack_slots = $backpack

const item_size = 63

var holding_item = null

func _ready():
	for inv_slot in hotbar_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
		
	for inv_slot in backpack_slots.get_children():
		inv_slot.connect("gui_input", self,"slot_gui_input",[inv_slot])
		
func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed && (slot.isBackpack==false or global.InventoryUp==true):
			if holding_item != null:
				if !slot.item:
					slot.putIntoSlot(holding_item)
					holding_item=null
				else:
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position.x = get_global_mouse_position().x - (item_size/2)
				holding_item.global_position.y = get_global_mouse_position().y - (item_size/2)
func _input(event):
	if holding_item:
		holding_item.global_position.x = get_global_mouse_position().x - (item_size/2)
		holding_item.global_position.y = get_global_mouse_position().y - (item_size/2)