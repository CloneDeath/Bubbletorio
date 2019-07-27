extends "res://Tiles/Manmade/FluidHolder/FluidHolder.gd"

func can_be_deleted(): return true;

func _process(_delta):
	$Sprite.rotation = direction.angle();

func tick():
	if (grid == null): return;
	var from = grid.get_tile_from_coord(coord + direction * -1);
	var to = grid.get_tile_from_coord(coord + direction);
	