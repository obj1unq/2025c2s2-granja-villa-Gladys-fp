import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	var ganancia = 0

	method sembrar(cultivo) {
	  cultivo.sembrar()
	}

	method regar(cultivo) {
	  cultivo.regar()
	}

	method cocechar(cultivo) {
	  cultivo.cocechar()
	}

	method verde(cultivo) {
		ganancia += cultivo.valor()
	}
}