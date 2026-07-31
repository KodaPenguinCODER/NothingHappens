extends Node2D

@onready var enemy_scene = preload("res://Scenes/Enemy.tscn")
@export var timer:Timer
@export var path_follow:PathFollow2D
var angle:float
var distance = 2000
var enemy_kill_count = 0
var enemy_happen_count = 0
var spawn_bool = true


#affects diffuculty
var enemy_speed = 100
var time = 1


var speed = 200

#i have these vars for future use, as we can now edit the proportion between time and speed on the fly in the game (diffuculty is gonna be for both of them)
var diffuculty : float
var enemy_cooldown_diff : float
var enemy_speed_diff : float

func _ready() -> void:
	diffuculty = 1.4
	enemy_cooldown_diff = 1
	enemy_speed_diff = 1

func _process(delta: float) -> void:
	spawn_enemy()
	path_follow.progress += speed * delta
	print(position)
	

func spawn_enemy():
	if spawn_bool:
		if timer.get_time_left() == 0:
			
			var enemy = enemy_scene.instantiate()
			
			angle = randf_range(0,360)
			enemy.position = global_position + ((global_transform.x*distance).rotated(deg_to_rad(angle))) #honestly just copied this from gun script
			
			#diff of enemies
			enemy.speed = enemy_speed * enemy_speed_diff * diffuculty
			timer.wait_time = time / enemy_cooldown_diff / diffuculty
			
			get_parent().get_parent().add_sibling(enemy)
			timer.start()
		
