extends Area2D
signal relou #para detectar quando o jogador eh tingido por um inimigo

export var velocidade = 400  # How fast the player will move (pixels/sec).
var tamanhoTela  # Size of the game window.

func _ready():
	tamanhoTela = get_viewport().size
	hide()
	
func _process(delta):
	var movimento = Vector2() #movimento do jogador eh um vetor
	if Input.is_action_pressed("ui_right"):
		movimento.x += 1 #pressionar para direita
	elif Input.is_action_pressed("ui_left"):
		movimento.x -= 1 #pressionar para esquerda
	elif Input.is_action_pressed("ui_down"):
		movimento.y += 1 #pressionar para cima
	elif Input.is_action_pressed("ui_up"):
		movimento.y -= 1 #pressionar para baixo
		
	if movimento.length() > 0:
		movimento = movimento.normalized()*velocidade
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += movimento*delta
	$Label.text = str(position.x)
	position.x = clamp(position.x, 0, tamanhoTela.x) #clamp limita a posicao do jogador, no caso, para ficar dentro do tamaho da tela
	position.y = clamp(position.y, 0, tamanhoTela.y)
	
	#"animacao do jogador"
	if movimento.x !=0:
		$AnimatedSprite.flip_h = movimento.x<0
	elif movimento.y !=0:
		$AnimatedSprite.flip_v = movimento.y>0

#sinal emitido quando um corpo entra em contato com o jogador
func _on_jogador_body_entered(body): 
	hide()
	emit_signal("relou")
	#abaixo, eh desativada as proximas colisoes, para que o sinal "relou" nao seja emitido novamente
	$CollisionShape2D.set_deferred("disabled", true)
	
#reiniciar o jogador, numa proxima partida
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

