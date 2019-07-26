extends Node2D

var _selected_command:Command = null;

var tile_empty = preload("res://Tiles/Empty/Empty.tscn");

func _on_TileGrid_tile_clicked(tile):
	if (Input.is_action_pressed("tile_click")):
		if (_selected_command == null): return;
		_selected_command.execute($TileGrid, tile);
	elif(Input.is_action_pressed("tile_delete")):
		if (tile.can_be_deleted()):
			$TileGrid.set_tile(tile.coord, tile_empty);

func _on_command_selected(command):
	_selected_command = command;
