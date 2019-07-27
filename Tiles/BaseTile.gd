extends Node2D

signal tile_clicked(tile);

var grid = null;
var coord:Vector2 = Vector2();
var direction = Vector2(1, 0);

func _input(event):
	var mouseEvent = event as InputEventMouse;
	if (mouseEvent == null): return;
	
	if (_event_should_trigger_click_event(event)
			|| _event_should_trigger_delete_event(event)):
		var bounds := Rect2(position-Vector2(8,8), Vector2(16, 16));
		if (bounds.has_point(mouseEvent.position)):
			tile_clicked();

func _event_should_trigger_click_event(event: InputEventMouse):
	if (event.is_action_released("tile_click")): return false;
	return Input.is_action_pressed("tile_click");

func _event_should_trigger_delete_event(event: InputEventMouse):
	if (event.is_action_released("tile_delete")): return false;
	return Input.is_action_pressed("tile_delete");

func tile_clicked():
	emit_signal("tile_clicked", self);
	
func is_empty(): return false;
func can_be_deleted(): return false;
func tick(): pass;