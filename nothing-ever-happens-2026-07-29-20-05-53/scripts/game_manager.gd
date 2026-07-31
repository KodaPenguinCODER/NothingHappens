extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel
var target: Node2D

func _process(_delta: float) -> void:
	if get_parent().inst_level:
		target = get_parent().inst_level.get_node("Path2D/PathFollow2D/Target")
		if (target.enemy_happen_count + target.enemy_kill_count) != 0:
			score = float(target.enemy_kill_count) / (target.enemy_happen_count + target.enemy_kill_count)
		else:
			score = 0
		score *= 100
		score_label.text = "Score:\n" + str(score).pad_decimals(1) + "%"
			
			#amount spawned - happened / amount spawned
