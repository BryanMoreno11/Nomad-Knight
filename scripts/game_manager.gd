extends Node
var points:int=0
var checkpoint:bool=false
var checkpoint_x:int=1912
var checkpoint_y:int=8
var canResume:bool=false
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
	if(Input.is_action_just_pressed("pause")):
		print("entro")
		get_tree().paused=true
		timer.start()

func resumeGame():
	if(Input.is_action_just_pressed("pause") and canResume==true):
		get_tree().paused=false
		



func _on_timer_timeout() -> void:
	print("time out")
	process_mode=PROCESS_MODE_WHEN_PAUSED
	canResume=true
	
	
