extends Node2D

onready var Enemy = load("res://Enemy.tscn")
export var prob = 0.8

onready var width = get_viewport().size.x
onready var height = get_viewport().size.y

func _ready():
	pass # Replace with function body.




func _on_Timer_timeout():
	if randf() < prob:
		var enemy = Enemy.instance()
		enemy.position.x = randi() % int(width)
		enemy.position.y = randi() % int(height)
		add_child(enemy)
