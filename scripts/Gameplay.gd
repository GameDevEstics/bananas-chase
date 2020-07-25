extends Node2D

export var actif = false

onready var player1 = $Player1
onready var player2 = $Player2

func _ready():
	pass # Replace with function body.

func _process(delta):
	if actif == true:
		player1.actif = true
		player2.actif = true
