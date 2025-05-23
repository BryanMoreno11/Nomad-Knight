extends Node
#Variables
@onready var animationPlataform= $plataform2/AnimationPlayer
var isMoving=false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if isMoving==false:
		animationPlataform.play("plataform_move")
		isMoving=true
