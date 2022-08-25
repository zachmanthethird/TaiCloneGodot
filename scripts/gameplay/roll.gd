class_name Roll
extends HitObject

## The distance between ticks in this [Roll].
var _tick_distance := 0.0

## The number of ticks in this [Roll].
var _total_ticks := 0

onready var body := $Scale/Body as Control
onready var head := $Scale/Head as CanvasItem
onready var tick := $Tick
onready var tick_container := $TickContainer


func _ready() -> void:
	body.rect_size.x = speed * length
	for tick_idx in range(_total_ticks):
		## The tick object to spawn.
		var new_tick := tick.duplicate() as TextureRect

		tick_container.add_child(new_tick)
		new_tick.rect_position.x = tick_idx * _tick_distance
		new_tick.show()


## Initialize [Roll] variables.
func change_properties(new_timing: float, new_speed: float, new_length: float, new_finisher: bool, new_bpm: float) -> void:
	.ini(new_timing, new_speed, new_length, new_finisher)
	_tick_distance = 15000 / new_bpm
	_total_ticks = int(round(length * 10000 / _tick_distance) / 10) + 1
	# TODO: Remove 1.9 scaling
	_tick_distance *= speed / 1.9 / new_bpm / 4.2


## See [HitObject].
func miss_check(hit_time: float) -> int:
	if state == int(State.FINISHED):
		return Score.FINISHED

	if hit_time - length > timing:
		state = int(State.FINISHED)
		queue_free()
		return Score.ACCURATE

	return 0


## See [HitObject].
func skin(new_skin: SkinManager) -> void:
	head.self_modulate = new_skin.roll_color
	body.modulate = new_skin.roll_color