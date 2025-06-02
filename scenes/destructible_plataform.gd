extends Area2D
@export var tilemap_layer:TileMapLayer

func break_tile():
	var tile_pos = tilemap_layer.local_to_map(global_position)
	print("la posicion del tile es ", tile_pos)
	tilemap_layer.erase_cell(tile_pos)





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	break_tile()
