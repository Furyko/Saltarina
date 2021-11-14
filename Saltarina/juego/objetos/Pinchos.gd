extends Area2D

export var es_Trampa = false

var color_trampa = Color.purple

onready var detector_pesonaje = $DetectorPersonaje


func _ready():
	if es_Trampa:
		$Sprite.modulate = color_trampa
		detector_pesonaje.enabled = true
		rotation_degrees = 180


func _process(_delta):
	if detector_pesonaje.is_colliding():
		detector_pesonaje.set_deferred("enabled", false)
		$AnimationPlayer.play("caer")


func _on_body_entered(body):
	body.respawn()
