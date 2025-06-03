extends Area2D
@export var tilemap_layer:TileMapLayer

#variables
var X=262
var Y=-15

func break_tiles():
	print("Entrada")
	for i in range(1,16):
		tilemap_layer.set_cell(Vector2i(X+i, Y),-1)





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	break_tiles()
