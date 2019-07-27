tool
extends Command
class_name SetTileCommand

export var tileScene:PackedScene = null;
var current_tile = null;
var _direction_index = 0;
var _directions = [
	Vector2.RIGHT,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.UP,
];

func _ready():
	load_new_tile();

func execute(grid, tile):
	if (!tile.is_empty()): return;
	current_tile.modulate = Color(1, 1, 1);
	current_tile.visible = true;
	grid.set_tile(tile.coord, current_tile);
	load_new_tile();

func load_new_tile():
	current_tile = tileScene.instance();
	update_tile();

func _get_configuration_warning():
	if (tileScene == null): return "TileScene not set";
	return "";

func _process(_delta):
	update_tile();

func _input(event):
	if (event.is_action_pressed("tile_rotate_cw")):
		_direction_index = (_direction_index + 1) % 4;
	if (event.is_action_pressed("tile_rotate_ccw")):
		_direction_index = (_direction_index - 1) % 4;
	
func update_tile():
	if (current_tile == null): return;
	if (Engine.editor_hint): return;
	current_tile.direction = _directions[_direction_index];