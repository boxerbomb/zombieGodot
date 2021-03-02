extends Panel


var ItemClass = preload("res://Item.tscn")
var item = null;
var isBackpack = false;

func _ready():
	if get_parent().name == "backpack":
		isBackpack=true
	else:
		isBackpack=false
	randomize()
	if randi()%2 == 0:
		item = ItemClass.instance()
		add_child(item)
		
		
func _input(event):
	if event is InputEventKey and get_parent().name=="hotbar":
		var show = false
		if self.name=="Slot1" && global.activeHotbarSlot==1:
			show=true
		elif self.name=="Slot2" && global.activeHotbarSlot==2:
			show=true
		elif self.name=="Slot3" && global.activeHotbarSlot==3:
			show=true			
		elif self.name=="Slot4" && global.activeHotbarSlot==4:
			show=true
		elif self.name=="Slot5" && global.activeHotbarSlot==5:
			show=true
		elif self.name=="Slot6" && global.activeHotbarSlot==6:
			show=true
		elif self.name=="Slot7" && global.activeHotbarSlot==7:
			show=true
		elif self.name=="Slot8" && global.activeHotbarSlot==8:
			show=true			
		elif self.name=="Slot9" && global.activeHotbarSlot==9:
			show=true
		get_child(0).visible = show
func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0,0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
