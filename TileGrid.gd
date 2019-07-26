extends Node2D

signal tile_clicked(tile);

export var Size:Vector2 = Vector2(35, 35);
export var TileSize:Vector2 = Vector2(16, 16);
export var TileSeparation:Vector2 = Vector2(1, 1);

var tile_brine = preload("res://Tiles/Natural/BrinePool/BrinePool.tscn");
var tile_empty = preload("res://Tiles/Empty/Empty.tscn");
var tile_ice = preload("res://Tiles/Natural/Ice/Ice.tscn");
var tile_vent = preload("res://Tiles/Natural/Vent/Vent.tscn");

func _ready():
	for x in range(Size.x):
		for y in range(Size.y):
			var coord = Vector2(x, y);
			var tile = _get_random_tile(y).instance();
			tile.position = coord_to_position(coord);
			tile.connect("tile_clicked", self, "tile_clicked");
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
	