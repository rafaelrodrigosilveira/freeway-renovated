extends Node
const novocarro = preload("res://carros_rigid_body_2d.tscn")
var pdevagar = [600,544,438,324,384,216,160]
var prapido = [488,272,104]
var score1 = 0
var score2 = 0


func _ready():
	pass 

# INSTANCIA NOVOS CARROS
func _on_horacarrorapido_timeout():
	var carrorapido = novocarro.instantiate()
	add_child(carrorapido)
	carrorapido.position.x = -10
	carrorapido.position.y = prapido[randi() % prapido.size()] # sorteia um carro
	carrorapido.linear_velocity = Vector2(randf_range(700,710),0) # movimenta carro da esquerda para direita


func _on_horacarrodevagar_timeout():
	var carrodevagar = novocarro.instantiate()
	add_child(carrodevagar)
	carrodevagar.position.x = -10
	carrodevagar.position.y = pdevagar[randi() % pdevagar.size()] # sorteia um carro
	carrodevagar.linear_velocity = Vector2(randf_range(300,310),0) # movimenta carro da esquerda para direita
