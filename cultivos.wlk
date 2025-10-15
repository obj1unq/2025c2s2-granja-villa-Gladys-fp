import wollok.game.*
import personaje.*

class Maiz {
	var property position = game.at(1, 1)
	const property valor = 5
	
	var property estadosMaiz = [baby, adulto] 
	var property estado = estadosMaiz.first()
	var property image =  estado.image()

	method haySiguienteEstado(){
		if(estadosMaiz.size() <= 1){	
			self.error("El maíz ya está maduro")
		}
	}

	method siguienteEstado(){
		self.haySiguienteEstado()
		estadosMaiz = estadosMaiz.drop(1)
		estado = estadosMaiz.first()
    	image = estado.image()// Actualiza la imagen según el nuevo estado		
	}

	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		game.removeVisual(self)
		game.addVisual(self)	
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

	method haySiguienteEstado(){
		if(transicionDeEtapas.size() <= 1){	
			self.error("El trigo ya está maduro")
		}
	}

	method siguienteEstado(){
		self.haySiguienteEstado()
		transicionDeEtapas = transicionDeEtapas.drop(1)
		self.imagenEnEtapa(transicionDeEtapas.first())	
	}

	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		game.removeVisual(self)
		game.addVisual(self)	
	}

	method image() {
		return imagen
	}
}



class Tomaco {
	var property position = game.at(3, 7)
	var imagenesTomate = ["tomaco_baby.png", "tomaco.png"]
	var property imagen = imagenesTomate.first() 

	method haySiguienteEstado(){
		if(imagenesTomate.size() <= 1){	
			self.error("El tomate ya está maduro")
		}
	}

	method siguienteEstado(){
		self.haySiguienteEstado()
		imagenesTomate = imagenesTomate.drop(1)
    	imagen = imagenesTomate.first() // Actualiza la imagen según el nuevo estado		
	}
	method hayParcelaArriba(){
		return game.at(self.position().x(), self.position().y() - 1)
	}

	method desplazarAlRegar1(){
		if(self.hayParcelaArriba()){
			position = game.at(position.x(), position.y() - 1)
			
			
		}else{
			position = game.at(self.position().x(),0)	
		}
	}

	method desplazarAlRegar(){
		const arriba = game.at(position.x(), position.y() - 1)
		if(arriba != null){
			position = arriba
		}else{
			position = game.at(position.x(), 0)
		}
	}


	method serRegado(){
		self.siguienteEstado()// Avanza al siguiente estado si hay uno    
		game.removeVisual(self)
		self.desplazarAlRegar()
		game.addVisual(self)	
	}

	method image() {
		return imagen
	}
}

