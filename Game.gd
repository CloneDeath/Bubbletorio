extends Node2D

var _selected_command:Command = null;
var _preview = null;

func _on_TileGrid_tile_clicked(tile):
	if (Input.is_action_pressed("tile_click")):
		if (_selected_command == null): return;
		_selected_command.execute($TileGrid, tile);
		update_command_preview();
	elif(Input.is_action_pressed("tile_delete")):
		if (tile.can_be_deleted()):
			$TileGrid.clear_tile(tile.coord);

func _on_command_selected(command):
	_selected_command = command;
	update_command_preview();

func update_command_preview():
	if (_preview != null):
		$TileGrid/Preview.remove_child(_preview);
	_preview = _selected_command.current_tile;
	$TileGrid/Preview.add_child(_preview);

func _process(_delta):
	var tile = $TileGrid.get_hovered_tile();
	if (tile != null && tile.is_empty()):
		$TileGrid/Preview.visible = true;
		set_preview(tile.coord);
	else:
		$TileGrid/Preview.visible = false;

func set_preview(coord:Vector2):
	if _selected_command == null: return;
	$TileGrid/Preview.position = $TileGrid.coord_to_position(coord);
