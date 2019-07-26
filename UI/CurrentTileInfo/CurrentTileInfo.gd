extends Control

var current_tile = null;

func set_current_tile(tile):
	if (tile == null): 
		visible = false;
		current_tile = null;
	elif (handles_tile(tile)):
		visible = true;
		current_tile = tile;
	else:
		visible = false;
		current_tile = null;

func handles_tile(_tile)->bool:
	assert(false);
	return false;