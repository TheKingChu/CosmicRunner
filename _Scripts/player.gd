extends Area2D

var speed: int = 250
var velocity = Vector2(0, 0)
const GRAVITY = 2
const JUMP_SPEED = 1
var is_on_floor: bool = false

func _process(delta):
	velocity.y += GRAVITY * delta
		
	if is_on_floor and Input.is_action_pressed("jump"):
		velocity.y = -JUMP_SPEED

	# Update position
	position += velocity * delta * speed

func _on_body_entered(body):
	if body.is_in_group("floor"):
		is_on_floor = true
		print("entered")


func _on_body_exited(body):
	if body.is_in_group("floor"):
		is_on_floor = false
		print("exited")
