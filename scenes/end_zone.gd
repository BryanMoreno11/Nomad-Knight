extends Node
@onready var timer=$Timer
@onready var sceneTransitionAnimation= $SceneTransitionAnimation/AnimationPlayer
var passed=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if passed==false:
		passed=true
		sceneTransitionAnimation.play("fade_in")
		var tween= create_tween()
		tween.tween_property(BackgroundMusic, "volume_db",-80,2)
		timer.start()
		print("Entro")


func _on_timer_timeout() -> void:
	BackgroundMusic.stop()
	get_tree().change_scene_to_file("res://scenes/gameEnd.tscn")
