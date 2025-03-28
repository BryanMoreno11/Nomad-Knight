extends Area2D
#Importaciones
@onready var gameManager= %GameManager
@onready var animationPlayer=$AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	gameManager.addPoints(1)
	animationPlayer.play("pickup")
