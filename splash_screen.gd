extends Node
func _ready():
	pass

func _on_start_pressed():
	# Muda a cena atual para a nova cena
	get_tree().change_scene_to_file("res://main.tscn")
