extends Node
var points:int=0
#importaciones
@onready var label= $CanvasLayer/Label

func addPoints(point:int):
	points+=point
	label.text= str(points)
	
