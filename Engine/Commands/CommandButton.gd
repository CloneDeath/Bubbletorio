tool
extends Button
class_name CommandButton

signal command_pressed(command);

func _pressed():
	var child = _get_command_child();
	emit_signal("command_pressed", child);

func _get_command_child()->Command:
	for child in get_children():
		if child is Command:
			return child;
	return null;

func _get_configuration_warning():
	if (_get_command_child() == null): return "No command children set";
	return "";