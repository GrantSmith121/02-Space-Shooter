extends Control


func _ready():
	pass


func _on_Play_again_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
	Global.lives = 5


func _on_Quit_pressed():
	get_tree().quit()
