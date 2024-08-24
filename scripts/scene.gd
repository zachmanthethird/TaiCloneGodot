class_name Scene
extends Node

## A child of the root viewport that contains a primary TaiClone scene.
##
## [code]iLevel 1[/code]


## Called when this scene should be removed.
func _scene_removed() -> void:
	queue_free()
