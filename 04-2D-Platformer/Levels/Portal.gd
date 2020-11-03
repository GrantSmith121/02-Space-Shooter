extends Area2D


func _ready():
	pass




func _on_Portal_entered(body):
	if body.name == "Player":
		if Global.level == 1:
			get_tree().change_scene("res://Levels/Level2.tscn")
		if Global.level == 2:
			get_tree().change_scene("res://Levels/Game_Over.tscn")
		Global.level += 1
