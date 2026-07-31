extends Node2D

const LEVEL_FOLDER_SIZE = 2 #reset this anytime new level is added
var selected_level = 1
var selected_level_path
var inst_level
@onready var player = get_node("player0")

#to make a new level simply duplicate the one of the level scenes, make a custom level 
#(make sure to not delete anything, the only thing you can remove is the tilemap) 
#put it in the levels folder and name it the next number after the previous highest level number. 
#then change the "level folder size" const
#player spawns at "PlayerSpawn" node in a level.
#you can freely edit the camera and the path of the target without issue

func _ready() -> void:
	load_random_level()
	
func load_random_level():
	
	if inst_level:
		inst_level.queue_free()
	
	selected_level = randi_range(1,LEVEL_FOLDER_SIZE)
	selected_level_path = str("res://Levels/" , selected_level , ".tscn")
	
	var packed_level = load(selected_level_path)
	inst_level = packed_level.instantiate()
	add_child(inst_level)
	
	player.position = inst_level.get_node("PlayerSpawn").position

func reload_level():
	if inst_level:
		inst_level.queue_free()
		print("deleted")
	
	var packed_level = load(selected_level_path)
	inst_level = packed_level.instantiate()
	add_child(inst_level)
	
	player.position = inst_level.get_node("PlayerSpawn").position
