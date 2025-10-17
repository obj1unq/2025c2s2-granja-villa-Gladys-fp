
import wollok.game.*
import personaje.*

class Maiz {

	var property estado = baby
	const property valor = 150
	var property position = game.at(1, 1)
	var property image =  estado.image()
	

	method verificarSiPuedeSerRegado(){
		if(not estado.puedeSerRegado()){
			self.error("Ya estoy madura")
		}
	}
	method verificarSiPuedeSerCosechado(){
		if(not estado.puedeSerCocechado()){
			self.error("El Maiz aun no esta listo")
		}
	}

	method actualizarEstado(){
		self.verificarSiPuedeSerRegado()
		estado = adulto
		image = estado.image()
	}

	method serRegado(){
		self.actualizarEstado()
		game.removeVisual(self)
		game.addVisual(self)
	}

	method serCosechado(){
		self.verificarSiPuedeSerCosechado()
		game.removeVisual(self)
	}
}



object baby {
	var property image =  "corn_baby.png"

	method puedeSerRegado(){  
		return true
	}
	method puedeSerCocechado(){ 
		return false
	}
}

object adulto {
	var property image =  "corn_adult.png"

	method puedeSerRegado(){  
		return false
	}
	method puedeSerCocechado(){ 
		return true
	}
}


class Trigo {
	var property estado = trigoEtapa0
	const property valor = estado.valor()
	var property position = game.at(1, 1)
	var property image =  estado.image()
	

	method verificarSiPuedeSerCosechado(){
		if(not estado.puedeSerCocechado()){
			self.error("El Trigo aun no esta maduro")
		}
	}

	method actualizarEstado(){	
		estado = estado.siguienteEtapa()
		image = estado.image()
	}

	method serRegado(){
		self.actualizarEstado()
		game.removeVisual(self)
		game.addVisual(self)
	}

	method serCosechado(){
		self.verificarSiPuedeSerCosechado()
		game.removeVisual(self)
	}
}



object trigoEtapa0 {
	const property valor = 0
	var property image = "wheat_0.png"

	method puedeSerCocechado(){ 
		return false
	}
	method siguienteEtapa(){
		return trigoEtapa1
	}
}

object trigoEtapa1 {
	const property valor = 0
	var property image = "wheat_1.png"

	method puedeSerCocechado(){ 
		return false
	}
	method siguienteEtapa(){
		return trigoEtapa2
	}
}

object trigoEtapa2 {
	const property valor = 100
	var property image = "wheat_2.png"

	method puedeSerCocechado(){ 
		return true
	}
	method siguienteEtapa(){
		return trigoEtapa3
	}
}

object trigoEtapa3 {
	const property valor = 200
	var property image = "wheat_3.png"

	method puedeSerCocechado(){
		return true
	}
	method siguienteEtapa(){
		return trigoEtapa0
	}
}


class Tomaco {

	var property estado = tomateBebe
	const property valor = 80
	var property position = game.at(1, 1)
	var property image =  estado.image()
	

	method verificarSiPuedeSerRegado(){
		if(not estado.puedeSerRegado()){
			self.error("Ya estoy madura")
		}
	}
	method verificarSiPuedeSerCosechado(){
		if(not estado.puedeSerCocechado()){
			self.error("El Tomate aun no esta maduro")
		}
	}

	method hayParcelaArriba(){
		return self.position().y()!= 9
	}

	method desplazarAlRegar(){
		if(self.hayParcelaArriba()){
			position = game.at(position.x(), position.y() + 1)
		}else{
			position = game.at(self.position().x(),0)	
		}
	}

	method actualizarEstado(){
		self.verificarSiPuedeSerRegado()
		estado = tomateAdulto
		image = estado.image()
	}

	method serRegado(){
		self.actualizarEstado()
		self.desplazarAlRegar()
		game.removeVisual(self)
		game.addVisual(self)
	}

	method serCosechado(){
		self.verificarSiPuedeSerCosechado()
		game.removeVisual(self)
	}
}



object tomateBebe {
	var property image = "tomaco_baby.png"

	method puedeSerRegado(){  
		return true
	}
	method puedeSerCocechado(){ 
		return false
	}
}

object tomateAdulto {
	var property image = "tomaco.png"

	method puedeSerRegado(){  
		return false
	}
	method puedeSerCocechado(){ 
		return true
	}
}
