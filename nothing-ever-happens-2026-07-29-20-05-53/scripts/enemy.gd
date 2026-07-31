extends Node2D

@onready var target = get_parent().get_node("Path2D/PathFollow2D/Target")
var speed #p/s to target
var health = 1


func _process(delta: float) -> void:
	look_at(target.global_position)
	
	rotation_degrees = fposmod(rotation_degrees, 360)  #just copied this from gun script lol
	
	if rotation_degrees > 90 and rotation_degrees < 270: 
		scale.y = -1
		scale.x = 1
	else:
		scale.y = 1
		scale.x = 1
	
	position += transform.x * speed * delta
	
	if health <= 0:
		#nothing special happens when the enemy dies, for now at least.
		target.enemy_kill_count +=1
		print(target.enemy_kill_count)
		queue_free()
		

func _on_area_entered(_area: Area2D) -> void:
	target.enemy_happen_count +=1
	print(target.enemy_happen_count+target.enemy_kill_count)
	queue_free()
