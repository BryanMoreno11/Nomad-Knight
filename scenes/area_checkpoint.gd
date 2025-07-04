extends Area2D
@onready var gameManager=%GameManager
@onready var audioPlayer=$AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	gameManager.checkpoint=true
	if position.x>gameManager.checkpoint_x:
		audioPlayer.play()
		gameManager.checkpoint_x= position.x
		gameManager.checkpoint_y=position.y
