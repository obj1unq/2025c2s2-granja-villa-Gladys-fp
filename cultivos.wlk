import wollok.game.*

class Maiz {
	var property position = game.at(1, 1)
	const property valor = 5
	

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
	
}

class Tomaco {
	var property position = game.at(3, 7)
	const property valor = 5

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco_baby.png"
	}
}

class Trigo {
	var property position = game.at(5, 6)
	const property valor = 5

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
}