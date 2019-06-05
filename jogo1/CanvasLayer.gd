extends CanvasLayer

signal iniciarGame

func mostrarMensagem(texto):
	$mensagem.text = texto
	$mensagem.show()
	$Timer.start()
	
func mostrarFimJogo():
	mostrarMensagem("game over!!!")
	yield($Timer, "timeout")
	$mensagem.text = "Dogde the"
	$mensagem.show()
	yield(get_tree().create_timer(1), 'timeout')
	$Button.show()
	
func atualizaPontos(score):
	$pontuacao.text = str(score)

func _on_Timer_timeout():
	$mensagem.hide()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciarGame")
