extends Area2D


export var velocidade = 400  # How fast the player will move (pixels/sec).
var tamanhoTela  # Size of the game window.

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
		$Sprite.move_child(self, movimento = movimento.normalized()*velocidade)
	else:
		
		

