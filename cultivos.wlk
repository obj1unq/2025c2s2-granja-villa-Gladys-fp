import wollok.game.*

class Maiz {
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(1, 1)
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
}

class Tomaco {
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(3, 7)
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco_baby.png"
	}
}

class Trigo {
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(5, 6)
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
}