extends "res://Tiles/BaseTile.gd"

var bubble_count:int = 0;
export var max_bubbles:int = 100;

func give_fluid_to(other: Node, amount:int):
	if (!other.is_in_group("fluid_holder")): return;
	amount = int(min(amount, other.max_bubbles - other.bubble_count));
	amount = int(min(amount, self.bubble_count));
	bubble_count -= amount;
	other.bubble_count += amount;

func take_fluid_from(other:Node, amount:int):
	if (!other.is_in_group("fluid_holder")): return;
	other.give_fluid_to(self, amount);