class_name VolumeControl
extends CanvasItem

## Comment
signal volume_changed

## Comment
var _cur_changing := 0

## Comment
var _master_modulate_tween := SceneTreeTween.new()

## Comment
var _master_progress_tween := SceneTreeTween.new()

## Comment
var _music_modulate_tween := SceneTreeTween.new()

## Comment
var _music_progress_tween := SceneTreeTween.new()

## Comment
var _self_tween := SceneTreeTween.new()

## Comment
var _sfx_modulate_tween := SceneTreeTween.new()

## Comment
var _sfx_progress_tween := SceneTreeTween.new()

onready var change_sound := $ChangeSound as AudioStreamPlayer
onready var master_vol := $Bars/Master as CanvasItem
onready var music_vol := $Bars/Specifics/Music as CanvasItem
onready var sfx_vol := $Bars/Specifics/SFX as CanvasItem
onready var taiclone := $"/root" as Root
onready var timer := get_tree().create_timer(0)


func _ready() -> void:
	if connect("volume_changed", taiclone, "save_settings", ["volume_changed"]):
		push_warning("Attempted to connect VolumeControl volume_changed.")


func _input(event: InputEvent) -> void:
	if not (event is InputEventWithModifiers and event.is_pressed()):
		return

	## Comment
	var m_event := event as InputEventWithModifiers

	if not m_event.alt:
		return

	if not modulate.a:
		_cur_changing = 0

	## Comment
	var vol_difference := 0.01 if m_event.control else 0.05

	if event.is_action("VolumeUp"):
		_change_volume(vol_difference)

	if event.is_action("VolumeDown"):
		_change_volume(-vol_difference)

	if event.is_action("VolumeNext"):
		change_channel(_cur_changing + 1, false)

	if event.is_action("VolumePrevious"):
		change_channel(_cur_changing + 2, false)


## Comment
func change_channel(channel: int, needs_visible := true) -> void:
	if needs_visible and not modulate.a:
		return

	_cur_changing = channel % taiclone.vols
	for i in range(taiclone.vols):
		## Comment
		var new_color := 1.0 if i == _cur_changing else 0.5

		## Comment
		var vol := _vol_view(i)

		if vol.modulate.a == new_color or not modulate.a:
			vol.modulate.a = new_color
			continue

		match vol:
			master_vol:
				_master_modulate_tween = _modulate_tween(vol, _master_modulate_tween, new_color)

			music_vol:
				_music_modulate_tween = _modulate_tween(vol, _music_modulate_tween, new_color)

			sfx_vol:
				_sfx_modulate_tween = _modulate_tween(vol, _sfx_modulate_tween, new_color)

	if modulate.a < 1:
		_tween_self(1, 0.25)

	timer = get_tree().create_timer(2)
	if timer.connect("timeout", self, "timeout"):
		push_warning("Attempted to connect Timer timeout.")


## Comment
func set_volume(channel: int, amount: float, needs_tween := false) -> void:
	AudioServer.set_bus_volume_db(channel, linear2db(amount))
	amount = round(amount * 100)

	## Comment
	var vol := _vol_view(channel)

	(vol.get_node("Percentage") as Label).text = str(amount)

	## Comment
	var progress := vol.get_node("TextureProgress") as TextureProgress

	if not needs_tween:
		progress.value = amount
		return

	match vol:
		master_vol:
			_master_progress_tween = _progress_tween(_master_progress_tween, progress, amount)

		music_vol:
			_music_progress_tween = _progress_tween(_music_progress_tween, progress, amount)

		sfx_vol:
			_sfx_progress_tween = _progress_tween(_sfx_progress_tween, progress, amount)


## Comment
func timeout() -> void:
	if timer.time_left <= 0:
		_tween_self(0, 1)


## Comment
func _change_volume(amount: float) -> void:
	change_channel(_cur_changing, false)

	## Comment
	var channel_volume := clamp(db2linear(AudioServer.get_bus_volume_db(_cur_changing)) + amount, 0, 1)

	set_volume(_cur_changing, channel_volume, true)
	change_sound.pitch_scale = channel_volume / 2 + 1
	change_sound.play()
	emit_signal("volume_changed")


## Comment
func _modulate_tween(vol: Node, tween: SceneTreeTween, new_color: float) -> SceneTreeTween:
	tween = Root.new_tween(tween, self).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

	## Comment
	var _tween = tween.tween_property(vol, "modulate:a", new_color, 0.2)

	return tween


## Comment
func _progress_tween(tween: SceneTreeTween, progress: Node, amount: float) -> SceneTreeTween:
	tween = Root.new_tween(tween, self).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

	## Comment
	var _tween = tween.tween_property(progress, "value", amount, 0.2)

	return tween


## Comment
func _tween_self(final_val: float, duration: float) -> void:
	_self_tween = Root.new_tween(_self_tween, self).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)

	## Comment
	var _tween := _self_tween.tween_property(self, "modulate:a", final_val, duration)


## Comment
func _vol_view(channel: int) -> CanvasItem:
	match channel:
		1:
			return music_vol

		2:
			return sfx_vol

		_:
			return master_vol