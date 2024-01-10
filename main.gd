extends Node
const novocarro = preload("res://carros_rigid_body_2d.tscn")
var pdevagar = [600,544,438,324,384,216,160]
var prapido = [488,272,104]
var score1 = 0
var score2 = 0


func _ready():
	$Button.hide() # esconde o botao
	$tema_AudioStreamPlayer2D3.play() # toca a musica do game
	randomize()

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

# EFETUA PONTUACAO PARA PLAYER1
func _on_player_pontua():
	if score1 < 10:
		score1 +=1
		$ponto_AudioStreamPlayer2D.play()
		$placar1.text = str(score1)
	if score1 >=10:
		$Button.show() # exibe botao de reinicio
		$tema_AudioStreamPlayer2D3.stop()
		$resultado.text = "Player 1 Ganhou!"
		$ganhou_AudioStreamPlayer2D2.play()
		$horacarrodevagar.stop()
		$horacarrorapido.stop()


func _on_player_2_pontua_2():
	if score2 < 10:
		score2 +=1
		$ponto_AudioStreamPlayer2D.play()
		$placar2.text = str(score2)
	if score2 >=10:
		$Button.show() # exibe botao de reinicio
		$tema_AudioStreamPlayer2D3.stop()
		$resultado.text = "Player 2 Ganhou!"
		$ganhou_AudioStreamPlayer2D2.play()
		$horacarrodevagar.stop()
		$horacarrorapido.stop()


func _on_button_pressed():
	get_tree().reload_current_scene()
