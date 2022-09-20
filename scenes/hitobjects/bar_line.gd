class_name BarLine
extends HitObject


## Initialize [BarLine] variables.
func change_properties(new_timing: float, new_speed: float, new_gameplay: Node) -> void:
	.ini(new_timing, new_speed, 0, new_gameplay)
	end_time += 10


## See [HitObject].
func miss_check(hit_time: float) -> bool:
	if hit_time > timing:
		state = int(State.FINISHED)
		if not visible:
			queue_free()

	return false
