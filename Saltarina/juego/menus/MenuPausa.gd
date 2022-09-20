extends Control


func _ready():
	visible = false
	
	
func _input(event):
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused


func _on_BotonContinuar_pressed():
	visible = false
	get_tree().paused = false


func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")


func _on_SliderVolumen_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_CheckFullscreen_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)
