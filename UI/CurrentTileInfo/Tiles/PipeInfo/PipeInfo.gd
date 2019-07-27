extends "res://UI/CurrentTileInfo/CurrentTileInfo.gd"

func handles_tile(tile)->bool:
	return tile.is_in_group("tile_pipe");