extends Node2D

onready var scene_menu = $Menu
onready var scene_gameplay = $Gameplay
onready var buttons = $Button
onready var PlayButton = $Button/PlayButton

func _ready():
	scene_menu.show()
	buttons.show()
	scene_gameplay.hide()

#func _process(delta):
#	pass

func _on_PlayButton_pressed():
	scene_menu.hide()
	buttons.hide()
	scene_gameplay.show()
	scene_gameplay.actif = true
