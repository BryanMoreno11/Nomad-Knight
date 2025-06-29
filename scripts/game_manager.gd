extends Node
var points:int=0
var checkpoint:bool=false
var checkpoint_x:int=0
var checkpoint_y:int=0
var canResume:bool=false
var isPaused:bool=false
#importaciones
@onready var label= $CanvasLayer/Label
@onready var timer= $Timer


func _process(delta: float) -> void:
	pauseGame()
	resumeGame()

func addPoints(point:int):
	points+=point
	label.text= str(points)
	
func pauseGame():
	if(Input.is_action_just_pressed("pause") and isPaused==false):
		get_tree().paused=true
		isPaused=true
		timer.start()

func resumeGame():
	process_mode= PROCESS_MODE_ALWAYS
	if(Input.is_action_just_pressed("pause") and canResume==true):
		get_tree().paused=false
		canResume=false
		isPaused=false
		

func _on_timer_timeout() -> void:
	print("time out")
	canResume=true
	
	
