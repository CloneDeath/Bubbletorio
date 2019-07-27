extends VBoxContainer

func set_current_tile(tile):
	for child in get_children():
		child.propagate_call("set_current_tile", [tile]);