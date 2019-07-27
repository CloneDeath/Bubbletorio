extends "res://Tiles/BaseTile.gd"

func can_be_deleted(): return true;

func _process(_delta):
	$Sprite.rotation = direction.angle();