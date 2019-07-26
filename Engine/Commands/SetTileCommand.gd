tool
extends Command
class_name SetTileCommand

export var tileScene:PackedScene = null;

func execute(grid, tile):
	if (!tile.is_empty()): return;
	grid.set_tile(tile.coord, tileScene);

func _get_configuration_warning():
	if (tileScene == null): return "TileScene not set";
	return "";