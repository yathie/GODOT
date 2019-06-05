extends Node

export (PackedScene) var inimigo

var pontuacao

func _ready():
	pass # Replace with function body.

func fimJogo():
	$atualizaPontuacao.stop()
	$gerarInimigo.stop()
	$CanvasLayer.mostrarFimJogo()
	
func novoJogo():
	pontuacao = 0
	$jogador.start($posicaoInicial.position)
	$comecarJogo.start()
	$CanvasLayer.atualizaPontos(pontuacao)
	$CanvasLayer.mostrarMensagem("go!")

func _on_comecarJogo_timeout():
	$gerarInimigo.start()
	$atualizaPontuacao.start()

func _on_atualizaPontuacao_timeout():
	pontuacao +=1
	$CanvasLayer.atualizaPontos(pontuacao)

func _on_gerarInimigo_timeout():
	#escolhe um local alatorio
	$caminhoInimigo/localGerarInimigo.set_offset(randi())
	#cria uma instancia de inimigo e adiciona na cena
	var inimig = inimigo.instance()
	add_child(inimig)
	# define a direcao perpendicular do inimigo à direcao do local...
	var direcao = $caminhoInimigo/localGerarInimigo.rotation + PI/2
	#define a posicao do inimigo
	inimig.position = $caminhoInimigo/localGerarInimigo.position
	#adiciona aletoriedade à direcao
	direcao += rand_range(-PI/4,PI/4)
	inimig.rotation = direcao
	#define movimento (velocidade e direcao)
	inimig.linear_velocity = Vector2(rand_range(inimig.velocidade_min, inimig.velocidade_max), 0)
	inimig.linear_velocity = inimig.linear_velocity.rotated(direcao)
	$CanvasLayer.connect("iniciarGame", inimig, "_on_start_game")


