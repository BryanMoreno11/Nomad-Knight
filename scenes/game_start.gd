extends Node2D
@onready var sceneTransitionAnimation= $SceneTransitionAnimation/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BackgroundMusic.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("pause")):
		sceneTransitionAnimation.play("fade_in")
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/game.tscn")
