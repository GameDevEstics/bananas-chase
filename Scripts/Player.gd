extends KinematicBody2D

const MAX_SPEED = 80
const ACCELERATION = 400
const FRICTION = 400

var velocity = Vector2.ZERO

onready var anim_perso = $AnimPerso

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
	

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 32
	position.y = 64

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector.x > 0 and input_vector.y == 0:
		anim_perso.play("DeplDroite")
	elif input_vector.x < 0 and input_vector.y == 0:
		anim_perso.play("DeplGauche")

	if input_vector.y > 0 and input_vector.x == 0:
		anim_perso.play("DeplBas")
	elif input_vector.y < 0 and input_vector.x == 0:
		anim_perso.play("DeplHaut")
		
			
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#velocity += input_vector * ACCELERATION * delta
		#velocity = velocity.clamped(MAX_SPEED * delta)
	else :
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
