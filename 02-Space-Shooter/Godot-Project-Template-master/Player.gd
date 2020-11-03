extends KinematicBody2D

var ready_to_shoot = true
onready var Shot = load("res://Shot.tscn")
onready var HUD = get_node("/root/Game/HUD")
onready var global = get_node("/root/Global")

func _ready():
	pass

func _process(_delta):
	pass

func _physics_process(_delta):
	var mouse = get_local_mouse_position()
	rotation += mouse.angle()
	rotation_degrees += 90
	if Input.is_action_pressed("Fire"):
		shoot() 
	if Input.is_action_pressed("Up"):
		position.y -= 5
	if Input.is_action_pressed("Down"):
		position.y += 5
	if Input.is_action_pressed("Left"):
		position.x -= 5
	if Input.is_action_pressed("Right"):
		position.x += 5                     

func shoot():
	if ready_to_shoot:
		var s = Shot.instance()
		s.position = position
		s.position += Vector2(0, -40).rotated(rotation)
		s.rotation = rotation
		s.velocity = s.velocity.rotated(rotation)
		get_parent().add_child(s)
		ready_to_shoot = false
		$Reload.start()


func _on_Reload_timeout():
	ready_to_shoot = true

func _on_Damage_body_entered(body):
	HUD.update_health(-20)
	if global.health <= 0:
		get_tree().change_scene("res://Die.tscn")
	body.queue_free()
