extends Control


onready var nubes = $ParallaxBackground/ParallaxNubesLejanas
onready var checkboxFullscreen = $VBoxContainer/HBoxContainer/CheckFullscreen
onready var esFullscreen = OS.window_fullscreen

func _ready():
	checkboxFullscreen.pressed = esFullscreen

func _process(_delta):
	nubes.global_position.x -= 3
	
	
func _on_BotonMenu_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")


func _on_SliderVolumen_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_CheckFullscreen_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)
