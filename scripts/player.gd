extends CharacterBody2D
const SPEED = 150
const JUMP_VELOCITY = -300.0
#Variables
var coyoteTime:bool=true
#Importaciones
@onready var  animatedSprite2D=$AnimatedSprite2D
@onready var  coyoteTimer=$CoyoteTimer

func _on_coyote_timer_timeout() -> void:
	coyoteTime=false
	print("El valor del coyote time al acabar el timer es ", coyoteTime)


#Funciones
func _physics_process(delta: float) -> void:
	#Coyote Time
	if is_on_floor():
		coyoteTime=true
		print ("El valor de coyote time al pisar el suelo es ", coyoteTime)
	elif (not is_on_floor() and coyoteTimer.time_left<=0):
		coyoteTimer.start()
	#Caída
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Salto
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or coyoteTime==true):
		coyoteTime=false
		velocity.y = JUMP_VELOCITY
	#Animaciones
	var direction := Input.get_axis("move_left", "move_right")
	if (direction<0):
		animatedSprite2D.flip_h=true
	if (direction>0):
		animatedSprite2D.flip_h=false
	if is_on_floor():
		if (direction==0):
			animatedSprite2D.play("default")
		else:
			animatedSprite2D.play("run")
	else:
		animatedSprite2D.play("jump")
	#Movimiento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
