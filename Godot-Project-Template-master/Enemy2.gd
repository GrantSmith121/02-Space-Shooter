extends KinematicBody2D

onready var ppos = load("res://Player.tscn")
onready var HUD = get_node("/root/Game/HUD")
onready var Global = get_node("/root/Global")

var velocity = Vector2(0, -5)
export var rotate_speed = 0.1
export var move_speed = 6
export var points = 20

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	
	
	var target = get_node("/root/Game/PlayerArea/Player").position
	look_at(target)
	rotation_degrees += 90
	var velocity = Vector2(target.x-position.x, target.y-position.y)
	if velocity.length() > move_speed:
		position += velocity.normalized()*move_speed

func die():
	HUD.update_score(points)
	queue_free()
