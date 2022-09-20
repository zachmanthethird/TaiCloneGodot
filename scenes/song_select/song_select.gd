extends Scene

## Comment
var thread := Thread.new()

onready var root_viewport := $"/root" as Root
onready var charts := $Charts


func _ready() -> void:
	Engine.target_fps = 120
	if thread.start(self, "load_metadata", [root_viewport.taiclone_songs_folder()]):
		push_warning("Attempted to load charts in song select.")

	## Comment
	var bars_object := root_viewport.add_scene(root_viewport.bars.instance(), ["SongSelect"]) as Bars

	bars_object.back_scene = root_viewport.main_menu
	bars_object.play_date.hide()


func _exit_tree() -> void:
	thread.wait_to_finish()


## Comment
func load_metadata(folders: Array) -> void:
	## Comment
	var directory := Directory.new()

	## Comment
	var f := File.new()

	while not folders.empty():
		## Comment
		var folder_path = str(folders.pop_back())

		if directory.open(folder_path):
			print_debug("Songs folder not found.")
			continue

		if directory.list_dir_begin(true):
			push_warning("Unable to read songs folder.")
			directory.list_dir_end()
			continue

		while true:
			## Comment
			var file_name := directory.get_next()

			if not file_name:
				break

			if directory.current_is_dir():
				folders.append(folder_path.plus_file(file_name))
				continue

			if f.open(folder_path.plus_file(file_name), File.READ):
				f.close()
				continue

			if f.get_line() != ChartLoader.FUS_VERSION:
				f.close()
				continue

			## Comment
			var song_button := root_viewport.song_button_object.instance() as SongButton

			song_button.chart.change_chart_properties(f.get_line(), f.get_line(), f.get_line(), f.get_line(), f.get_line(), f.get_line(), f.get_line(), f.get_line(), file_name, folder_path)
			f.close()
			charts.call_deferred("add_child", song_button)
