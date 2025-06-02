extends CharacterBody2D
const SPEED = 150
const JUMP_VELOCITY = -300.0
const X=-75
const Y=8
#Variables
var coyoteTime:bool=true
@export var attacking:bool=false
#Importaciones
@onready var  animatedSprite2D=$AnimatedSprite2D
@onready var  animationPlayer=$AnimationPlayer
@onready var  coyoteTimer=$CoyoteTimer
@onready var  attackCollision=$AreaAttack/AttackCollisionShape2D
@onready var  audioJump=$AudioJump



func  _ready() -> void:
	attackCollision.disabled=true
	#position.x=X
	#position.y=Y
	

func _on_coyote_timer_timeout() -> void:
	coyoteTime=false

func animations()->void:
	var direction := Input.get_axis("move_left", "move_right")
	if (direction<0):
		animatedSprite2D.flip_h=true
	if (direction>0):
		animatedSprite2D.flip_h=false
	if is_on_floor():
		if(attacking and animatedSprite2D.flip_h==false):
			animationPlayer.play("attack")
		elif(attacking and animatedSprite2D.flip_h==true):
			animationPlayer.play("attack_left")
		elif (direction==0):
			animatedSprite2D.play("default")
		else:
			animatedSprite2D.play("run")
	else:
		animatedSprite2D.play("jump")


func attack():
	if Input.is_action_just_pressed("attack") and is_on_floor():
		attacking=true

func jump(delta):
	#Coyote Time
	if is_on_floor():
		coyoteTime=true
	elif (not is_on_floor() and coyoteTimer.time_left<=0):
		coyoteTimer.start()
	#Caída
	if not is_on_floor():
		velocity += get_gravity() * delta
	#Salto
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or coyoteTime==true):
		audioJump.play()
		coyoteTime=false
		velocity.y = JUMP_VELOCITY
	
func movement():
	var direction := Input.get_axis("move_left", "move_right")
	if direction and !attacking:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

#Funciones
func _physics_process(delta: float) -> void:
	movement()
	jump(delta)
	attack()
	animations()
	move_and_slide()
