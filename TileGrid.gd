extends Node2D

signal tile_clicked(tile);
signal tile_hovered(tile);

export var Size:Vector2 = Vector2(35, 35);
export var TileSize:Vector2 = Vector2(16, 16);
export var TileSeparation:Vector2 = Vector2(1, 1);
export var TicksPerSecond:float = 1;

var tile_brine = preload("res://Tiles/Natural/BrinePool/BrinePool.tscn");
var tile_empty = preload("res://Tiles/Empty/Empty.tscn");
var tile_ice = preload("res://Tiles/Natural/Ice/Ice.tscn");
var tile_vent = preload("res://Tiles/Natural/Vent/Vent.tscn");

var tile_map = {};
var hovered_tile = null;
var tick_time = 0;

func _ready():
	for x in range(Size.x):
		for y in range(Size.y):
			var coord = Vector2(x, y);
			var tileScene = _get_random_tile(y);
			set_tile(coord, tileScene);

func _process(delta):
	check_hovered_tile();
	update_ticks(delta);

func update_ticks(delta):
	tick_time += delta;
	var next_tick = 1.0/TicksPerSecond;
	while (tick_time > next_tick):
		tick_time -= next_tick;
		trigger_tick();

func trigger_tick():
	for child in get_children():
		child.tick();
	
func check_hovered_tile():
	var mouse_position = get_viewport().get_mouse_position();
	var coord = get_coord_from_position(mouse_position);
	var tile = get_tile_from_coord(coord);
	if (tile != hovered_tile):
		hovered_tile = tile;
		emit_signal("tile_hovered", hovered_tile);

func get_coord_from_position(position:Vector2):
	var tileSep = (TileSize + TileSeparation);
	return Vector2(floor(position.x / tileSep.x), floor(position.y / tileSep.y));

func get_tile_from_coord(coord:Vector2):
	if (tile_map.has(coord)): return tile_map[coord];
	return null;

func set_tile(coord:Vector2, tileScene:PackedScene):
	var previous_tile = get_tile_from_coord(coord);
	if (previous_tile != null):
		previous_tile.queue_free();
	var tile = tileScene.instance();
	tile.position = coord_to_position(coord);
	tile.coord = coord;
	tile.connect("tile_clicked", self, "tile_clicked");
	tile.grid = self;
	tile_map[coord] = tile;
	add_child(tile);

func tile_clicked(tile):
	emit_signal("tile_clicked", tile);

func _get_tile_selection(y: int):
	if (y <= Size.y * 1 / 4): return [tile_ice];
	if (y <= Size.y * 3 / 4): return [tile_vent];
	return [tile_brine];

func _get_random_tile(y: int):
	if (randi() % 100 <= 95): return tile_empty;
	var selection = _get_tile_selection(y);
	return selection[randi() % selection.size()];

func coord_to_position(coord:Vector2): 
	return (TileSize/2) + (TileSize + TileSeparation) * coord;
	