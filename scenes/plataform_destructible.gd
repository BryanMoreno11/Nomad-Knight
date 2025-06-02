extends RigidBody2D
@export var tilemap:TileMapLayer

func break_tile():
	tilemap.set_cell(tilemap.local_to_map(global_position))
	queue_free()





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
