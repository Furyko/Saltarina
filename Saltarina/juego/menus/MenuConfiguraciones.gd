extends Control


onready var nubes = $ParallaxBackground/ParallaxNubesLejanas


func _process(_delta):
	nubes.global_position.x -= 3
	
	
func _on_BotonMenu_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")


func _on_SliderVolumen_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
