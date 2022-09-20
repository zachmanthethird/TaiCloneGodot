class_name Tick
extends HitObject


func _ready() -> void:
	rect_position.x = timing + margin_left


## Applies the [member root_viewport]'s [SkinManager] to this [Node]. This method is seen in all [Node]s in the "Skinnables" group.
func apply_skin() -> void:
	texture = root_viewport.skin.tick_texture


## See [HitObject].
func auto_hit(hit_time: float, hit_left: bool) -> int:
	## Comment
	var early := hit_time < timing

	if state != int(State.ACTIVE) or early:
		return int(early)

	## Comment
	var action_event := InputEventAction.new()

	action_event.action = ("Left" if hit_left else "Right") + "Don"
	action_event.pressed = true
	Input.parse_input_event(action_event)
	return 2


## Initialize [Tick] variables.
func change_properties(new_timing: float, new_gameplay: Node) -> void:
	.ini(new_timing, 0, 0, new_gameplay)


## See [HitObject].
func hit(inputs: Array, hit_time: float) -> bool:
	## Comment
	var early := hit_time < timing

	if state != int(State.ACTIVE) or early:
		return early

	inputs.insert(0, int(inputs.pop_front()) + 1)
	finish(int(Score.ROLL))
	return false


## See [HitObject].
func miss_check(hit_time: float) -> bool:
	if hit_time > timing:
		finish()
		return false

	return true
