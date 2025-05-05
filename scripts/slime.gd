extends Node2D
#Constantes
const speed=60
#Variables
var direction=1
@onready var rayCastRight=$RayCastRight
@onready var  rayCastLeft=$RayCastLeft
@onready var animatedSprite=$AnimatedSprite2D
@onready var animationPlayer=$AnimationPlayer





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(rayCastRight.is_colliding()):
		direction=-1
		animatedSprite.flip_h=true
	if(rayCastLeft.is_colliding()):
		direction=1
		animatedSprite.flip_h=false
	position.x+=direction* speed*delta
	
func takeDamage():
	queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	print("Enemigo atacado")
	animationPlayer.play("new_animation")
