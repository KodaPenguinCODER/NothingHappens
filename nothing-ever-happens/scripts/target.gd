extends Node2D

@onready var enemy_scene = preload("res://Scenes/Enemy.tscn")
@export var timer:Timer
var angle:float
var distance = 700
#affects diffuculty
var speed = 100
var time = 1

#i have these vars for future use, as we can now edit the proportion between time and speed on the fly in the game (diffuculty is gonna be for both of them)
var diffuculty : float
var enemy_cooldown_diff : float
var enemy_speed_diff : float

func _ready() -> void:
	diffuculty = 1
	enemy_cooldown_diff = 1
	enemy_speed_diff = 1

func _process(_delta: float) -> void:
	spawn_enemy()

func spawn_enemy():
	if timer.get_time_left() == 0:
		
		var enemy = enemy_scene.instantiate()
		
		angle = randf_range(0,360)
		enemy.position = global_position + ((global_transform.x*distance).rotated(deg_to_rad(angle))) #honestly just copied this from gun script
		
		#diff of enemies
		enemy.speed = speed * enemy_speed_diff * diffuculty
		timer.wait_time = time / enemy_cooldown_diff / diffuculty
		
		add_sibling(enemy)
		timer.start()
