extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# escolhe cores aleatorias para os carros
	var cordocarro = $AnimatedSprite2D.sprite_frames.get_animation_names() # obtem as animações para sortear
	$AnimatedSprite2D.animation = cordocarro[randi() % cordocarro.size()] # sorteia cor do carro

# funcao do carro apos sair tela
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # limpa carros que sairam da tela
