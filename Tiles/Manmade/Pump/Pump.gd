extends "res://Tiles/Manmade/FluidHolder/FluidHolder.gd"

func can_be_deleted(): return true;

func _process(_delta):
	$Sprite.rotation = direction.angle();

func tick():
	if (grid == null): return;
	var to = grid.get_tile_from_coord(coord + direction);
	give_fluid_to(to, max_bubbles);
	
	var from = grid.get_tile_from_coord(coord + direction * -1);
	take_fluid_from(from, max_bubbles);
	