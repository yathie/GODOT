extends RigidBody2D

export var velocidade_min =150
export var velocidade_max = 250

var tipos_inimigos = ["carro", "carroLouco", "coelho"]

func _ready():
	#escolher aleatoriamento o inimigo
	$AnimatedSprite.animation = tipos_inimigos[randi() % tipos_inimigos.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #quando o sinal eh emitido ("saiu da tela") o inimigo é excluido da tela

func _on_start_game():
	queue_free()