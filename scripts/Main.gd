extends Node2D

onready var scene_menu = $Menu
onready var scene_gameplay = $Gameplay
onready var buttons = $Button
onready var PlayButton = $Button/PlayButton

onready var menu_sound = $MenuSound
onready var gameplay_sound = $GameplaySound

func _ready():
	gameplay_sound.stop()
	menu_sound.play()
	
	scene_menu.show()
	buttons.show()
	scene_gameplay.hide()

#func _process(delta):
#	pass

func _on_PlayButton_pressed():
	menu_sound.stop()
	gameplay_sound.play()
	
	scene_menu.hide()
	buttons.hide()
	scene_gameplay.show()
	scene_gameplay.actif = true
