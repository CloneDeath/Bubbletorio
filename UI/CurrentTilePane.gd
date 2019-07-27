extends VBoxContainer

func set_current_tile(tile):
	self.propagate_call("set_current_tile", [tile]);