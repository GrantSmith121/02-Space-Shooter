extends KinematicBody2D

export var speed = 2
export var damage = 10
var direction = 1
var velocity = Vector2.ZERO

func _physics_process(_delta):
	if direction < 0 and !$Sprite.flip_h:
		$Sprite.flip_h = false
	if direction > 0 and $Sprite.flip_h:
		$Sprite.flip_h = true
	
	velocity.x -= direction
	move_and_slide(velocity, Vector2.UP)
	for l in get_slide_count():
		var collision = get_slide_collision(l)
	
	velocity.y = 1000



func _on_Area2D_body_entered(body):
	if velocity.x != 0 and body.name == "Walls":
		velocity.x = velocity.x + 10
		direction -= 1
	if body.name == "Player":
		body.do_damage(damage)
		queue_free()
