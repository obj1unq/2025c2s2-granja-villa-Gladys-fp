import wollok.game.*
import personaje.*


class Maiz {
	var property position = game.at(1, 1)
	const property valor = 5
	var estado = baby
	

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_" + estado + ".png"
	}

	method serRegado(){
	  return
	}
	
}

object baby {
  
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