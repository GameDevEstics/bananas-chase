extends KinematicBody2D

export var actif = false

var MAX_SPEED = 96
const ACCELERATION = 400
const FRICTION = 400

var score = 0
var velocity = Vector2.ZERO

onready var anim_perso = $AnimPerso

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 36
	position.y = 62

func _physics_process(delta):
	if self.actif:
		var input_vector = Vector2.ZERO
		
		input_vector.x = Input.get_action_strength("p1_right") - Input.get_action_strength("p1_left")
		input_vector.y = Input.get_action_strength("p1_down") - Input.get_action_strength("p1_up")
		
		input_vector = input_vector.normalized()
				
		if input_vector != Vector2.ZERO :
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
			#velocity += input_vector * ACCELERATION * delta
			#velocity = velocity.clamped(MAX_SPEED * delta)
		else :
			velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
		var collision = move_and_collide(velocity * delta)
		
		if input_vector.x > 0 and input_vector.y == 0 and not collision:
			anim_perso.play("DeplDroite")
		elif input_vector.x < 0 and input_vector.y == 0 and not collision:
			anim_perso.play("DeplGauche")
	
		if input_vector.y > 0 and not collision:
			anim_perso.play("DeplBas")
		elif input_vector.y < 0 and not collision:
			anim_perso.play("DeplHaut")
			
		if collision :
			if "banane" in collision.collider.get_groups():
				var banane = collision.collider
				score += 20
				print("Joueur 1\nscore : " , score)
				banane.queue_free()
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
