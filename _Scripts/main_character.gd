extends CharacterBody2D

const JUMP_SPEED = -300
@onready var sprite2d = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if velocity.x > -1:
		sprite2d.animation = "Run"
	
	#adding gravity to player
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite2d.animation = "Jumping" #if the player is in the air
	
	#Jumping is space is pressed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
		
	move_and_slide()
