extends CharacterBody2D

const MAX_SPEED = 230

@onready var animationPlayer = $AnimationPlayer
@onready var sprite = $Sprite2D

var input_vector = Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()
	velocity = input_vector * MAX_SPEED
	
	if input_vector != Vector2.ZERO:
		sprite.scale.x = sign(input_vector.x)
		animationPlayer.play("Run")
	else:
		animationPlayer.play("RESET")
	
	move_and_slide()
