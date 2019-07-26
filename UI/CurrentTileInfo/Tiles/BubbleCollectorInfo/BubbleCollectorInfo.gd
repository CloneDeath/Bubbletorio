extends "res://UI/CurrentTileInfo/CurrentTileInfo.gd"

func handles_tile(tile)->bool:
	return tile.is_in_group("bubble_collector");

func _process(_delta):
	if (current_tile == null): return;
	$Properties/RangeValue.text = str(current_tile.tile_range, " Tiles");
	$Properties/VentsInRangeValue.text = \
		str(current_tile.count_vents_in_range(), " Vents");
	$Properties/BubblesValue.text = \
		str(current_tile.bubble_count, "/", current_tile.max_bubbles, 
		" Bubbles");