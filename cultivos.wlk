import wollok.game.*
import personaje.*

class Maiz {
	var property position = game.at(1, 1)
	const property valor = 150
	
	var property estadosMaiz = [baby, adulto] 
	var property estado = estadosMaiz.first()
	var property image =  estado.image()


	method haySiguienteEstado(){ //puedo separa en dos subtareas para reutilizar la funcion
		return estadosMaiz.size() > 1
	}

	method verificarSiNoEstaMaduro(){
		if(not self.haySiguienteEstado()){
			self.error("El maíz ya está maduro")
		}
	}

	method siguienteEstado(){
		self.verificarSiNoEstaMaduro()
		estadosMaiz = estadosMaiz.drop(1)
		estado = estadosMaiz.first()
    	image = estado.image()// Actualiza la imagen según el nuevo estado		
	}

	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		game.removeVisual(self)
		game.addVisual(self)	
	}

	method verificarSiEstaMaduro(){
		if(self.haySiguienteEstado()){
			self.error("El Maiz aun no esta Maduro")
		}
	}

	method serCosechado(){
		self.verificarSiEstaMaduro()
		game.removeVisual(self)
	}

}

object baby {
	var property image =  "corn_baby.png"
}

object adulto {
	var property image =  "corn_adult.png"
  
}


class Trigo {
	var property position = game.at(5, 6)
	const etapasTotales = [0,1,2,3] // defini esto porque en algun momento se reinicia
	var property transicionDeEtapas = etapasTotales 
	var imagen = "wheat_0.png"

	method imagenEnEtapa(etapa){
		imagen = "wheat_"+etapa+".png" 
	}

	method haySiguienteEstado(){ // verificar si queda en tres reiniciar las etapas
		return transicionDeEtapas.size() > 1	
	}

	method verificarSiNoEstaMaduro(){
		if(not self.haySiguienteEstado()){
			self.error("El trigo ya está maduro")
		}
	}

	method siguienteEstado(){
		if(transicionDeEtapas.first() == 3){
			transicionDeEtapas = etapasTotales 
			self.imagenEnEtapa(transicionDeEtapas.first())
		}else{
		transicionDeEtapas = transicionDeEtapas.drop(1)
		self.imagenEnEtapa(transicionDeEtapas.first())			
		}
	
	}

	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		game.removeVisual(self)
		game.addVisual(self)	
	}

	method image() {
		return imagen
	}

	method verificarSiEstaMaduro(){
		if(transicionDeEtapas.size() > 2){
			self.error("El Trigo aun no esta Maduro")
		}
	}

	method serCosechado(){
		self.verificarSiEstaMaduro()
		game.removeVisual(self)
	}

	method valor(){
		if(transicionDeEtapas.size() == 2){
			return 100
		}else{
			return 200
		}
		
	}
}



class Tomaco {
	var property position = game.at(3, 7)
	var imagenesTomate = ["tomaco_baby.png", "tomaco.png"]
	var property imagen = imagenesTomate.first() 
	const property valor = 80 

	method haySiguienteEstado(){
		return imagenesTomate.size() > 1
	}

	method verificarSiNoEstaMaduro(){
		if(not self.haySiguienteEstado()){
			self.error("El tomate ya está maduro")
		}
	}

	method siguienteEstado(){
		self.verificarSiNoEstaMaduro()
		imagenesTomate = imagenesTomate.drop(1)
    	imagen = imagenesTomate.first() // Actualiza la imagen según el nuevo estado		
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


	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		//game.removeVisual(self)
		self.desplazarAlRegar()
		game.addVisual(self)	
	}

	method image() {
		return imagen
	}

	method verificarSiEstaMaduro(){
		if(self.haySiguienteEstado()){
			self.error("El Tomate aun no esta Maduro")
		}
		
	}

	method serCosechado(){
		self.verificarSiEstaMaduro()
		game.removeVisual(self)
	}

}

