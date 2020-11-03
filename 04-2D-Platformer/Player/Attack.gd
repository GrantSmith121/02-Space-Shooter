extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

var hitbox = 0

func start():
	player.set_animation("Attacking")
	$Timer.start()
	hitbox = 1

func _physics_process(_delta):
	if Input.is_action_just_pressed("attack"):
		start()




func _on_Area2D_body_entered(body):
	if not body.name == "Ground" and not body.name == "Platform" and not body.name == "Walls":
		if hitbox == 1:
			body.queue_free()
			Global.score += 100
		if hitbox == 0:
			pass


func _on_Timer_timeout():
	hitbox = 0
	player.set_animation("Idle")
