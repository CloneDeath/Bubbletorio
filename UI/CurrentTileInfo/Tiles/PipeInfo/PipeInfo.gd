extends "res://UI/CurrentTileInfo/CurrentTileInfo.gd"

func handles_tile(tile)->bool:
	return tile.is_in_group("tile_pipe");


func _process(_delta):
	if (current_tile == null): return;
	$Properties/BubblesValue.text = \
		str(current_tile.bubble_count, "/", current_tile.max_bubbles, 
		" Bubbles");