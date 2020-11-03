extends KinematicBody2D

var velocity = Vector2(0, -10)
export var points = 10
onready var Global = get_node("/root/Global")
onready var HUD = get_node("/root/Game/HUD")

func _ready():
	pass

func _physics_process(delta):
	position += velocity

func shot():
	set_collision_layer_bit(0, true)
	set_collision_mask_bit(0, true)

func _on_Target_body_entered(CollisionPolygon2D):
	.die("/root/Game/Enemy.tscn")


func _on_Area2D_body_entered(body):
	if body.has_method("die"):
		body.die()
	else:
		body.queue_free()
	queue_free()
