extends Node
var points:int=0
var checkpoint:bool=false
var checkpoint_x:int=1912
var checkpoint_y:int=8

#importaciones
@onready var label= $CanvasLayer/Label

func addPoints(point:int):
	points+=point
	label.text= str(points)
	
