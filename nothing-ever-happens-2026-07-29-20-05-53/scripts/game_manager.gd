extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel
@onready var target: Node2D = $"../Target"

func _process(_delta: float) -> void:
	if (target.enemy_happen_count + target.enemy_kill_count) != 0:
		score = float(target.enemy_kill_count) / (target.enemy_happen_count + target.enemy_kill_count)
	else:
		score = 0
	score *= 100
	score_label.text = "Score:\n" + str(score).pad_decimals(1) + "%"
		
		#amount spawned - happened / amount spawned
