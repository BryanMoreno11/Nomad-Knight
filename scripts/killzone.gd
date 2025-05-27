extends Area2D

@onready var timer= $Timer
@onready var gameManager= %GameManager


func _on_body_entered(body: Node2D) -> void:
	
	if (gameManager.checkpoint==false):
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	else:
		body.position.x=gameManager.checkpoint_x
		body.position.y=gameManager.checkpoint_y
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
