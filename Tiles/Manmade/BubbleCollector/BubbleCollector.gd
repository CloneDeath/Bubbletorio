extends "res://Tiles/Manmade/FluidHolder/FluidHolder.gd"

var tile_range = 2;

func tick():
	if (grid == null): return;
	
	var vents = count_vents_in_range();
	var bubbles = vents * 1;
	bubble_count = int(min(max_bubbles, bubble_count + bubbles));

func count_vents_in_range():
	var vents = 0;
	for x in range(coord.x-tile_range, coord.x+tile_range+1):
		for y in range(coord.y-tile_range, coord.y+tile_range+1):
			var scan = Vector2(x, y);
			var tile = grid.get_tile_from_coord(scan);
			if (tile.is_in_group("vent")):
				vents += 1;
	return vents;

func can_be_deleted(): return true;