class_name SkinManager

## The color of hit error markers with an ACCURATE [member HitObject.Score].
var accurate_color: Color

## The texture of a judgement with an ACCURATE [member HitObject.Score].
var accurate_judgement: Texture

## Comment
var approach_circle: Texture

## Comment
var bar_left_texture: Texture

## Comment
var bar_right_texture: Texture

## The color of [BarLine]s.
var barline_color: Color

## Comment
var big_circle: Texture

## Comment
var combo_break: AudioStream

## The color of don [Note]s.
var don_color: Color

## Comment
var don_texture: Texture

## The color of an early timing indicator or container.
var early_color: Color

## Comment
var hit_circle_overlay: Texture

## Comment
var hit_clap: AudioStream

## Comment
var hit_finish: AudioStream

## Comment
var hit_normal: AudioStream

## Comment
var hit_whistle: AudioStream

## The color of hit error markers with an INACCURATE [member HitObject.Score].
var inaccurate_color: Color

## The texture of a judgement with an INACCURATE [member HitObject.Score].
var inaccurate_judgement: Texture

## The color of kat [Note]s.
var kat_color: Color

## Comment
var kat_texture: Texture

## The color of a late timing indicator or container.
var late_color: Color

## The color of hit error markers with a MISS [member HitObject.Score].
var miss_color: Color

## The texture of a judgement with a MISS [member HitObject.Score].
var miss_judgement: Texture

## The color of [Roll]s.
var roll_color: Color

## Comment
var roll_end: Texture

## Comment
var roll_middle: Texture

## Comment
var spinner_approach: Texture

## Comment
var spinner_circle: Texture

## Comment
var spinner_warning: Texture

## Comment
var tick_texture: Texture


func _init(skin_path: String) -> void:
	accurate_color = Color("52a6ff")
	barline_color = Color.white
	don_color = Color("eb452c")
	early_color = Color("ff5a5a")
	inaccurate_color = Color("79da5e")
	kat_color = Color("438eac")
	late_color = Color("5a5aff")
	miss_color = Color("c74b4b")
	roll_color = Color("fcb806")
	accurate_judgement = load(skin_path.plus_file("taiko-hit300.png")) as Texture
	approach_circle = load(skin_path.plus_file("approachcircle.png")) as Texture
	bar_left_texture = load(skin_path.plus_file("taiko-bar-left.png")) as Texture
	bar_right_texture = load(skin_path.plus_file("taiko-bar-right.png")) as Texture
	big_circle = load(skin_path.plus_file("taikobigcircle.png")) as Texture
	combo_break = load(skin_path.plus_file("combobreak.wav")) as AudioStream
	don_texture = load(skin_path.plus_file("taiko-drum-inner.png")) as Texture
	hit_circle_overlay = load(skin_path.plus_file("taikohitcircleoverlay-0.png")) as Texture
	hit_clap = load(skin_path.plus_file("taiko-drum-hitclap.wav")) as AudioStream
	hit_finish = load(skin_path.plus_file("taiko-drum-hitfinish.wav")) as AudioStream
	hit_normal = load(skin_path.plus_file("taiko-drum-hitnormal.wav")) as AudioStream
	hit_whistle = load(skin_path.plus_file("taiko-drum-hitwhistle.wav")) as AudioStream
	inaccurate_judgement = load(skin_path.plus_file("taiko-hit100.png")) as Texture
	kat_texture = load(skin_path.plus_file("taiko-drum-outer.png")) as Texture
	miss_judgement = load(skin_path.plus_file("taiko-hit0.png")) as Texture
	roll_end = load(skin_path.plus_file("taiko-roll-end.png")) as Texture
	roll_middle = load(skin_path.plus_file("taiko-roll-middle.png")) as Texture
	spinner_approach = load(skin_path.plus_file("spinner-approachcircle.png")) as Texture
	spinner_circle = load(skin_path.plus_file("spinner-circle.png")) as Texture
	spinner_warning = load(skin_path.plus_file("spinner-warning.png")) as Texture
	tick_texture = load(skin_path.plus_file("sliderscorepoint.png")) as Texture
