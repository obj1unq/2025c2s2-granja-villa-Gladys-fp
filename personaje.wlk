import wollok.game.*
import cultivos.*


object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property monedas = oro
	const cultivos = granja




//----------SIEMBRASSS-------------

	method sembrarTrigo(){
		self.esParcelaDisponible()
		const trigo = new Trigo()
		trigo.position(self.position())
		game.addVisual(trigo)
		cultivos.agregarCultivo(trigo)
	}
	method sembrarTomate(){
		self.esParcelaDisponible()
		const tomate = new Tomaco()
		tomate.position(self.position())
		game.addVisual(tomate)
		cultivos.agregarCultivo(tomate)
	}
	method sembrarMaiz(){
		self.esParcelaDisponible()
		const maiz = new Maiz()
		maiz.position(self.position())
		game.addVisual(maiz)
		cultivos.agregarCultivo(maiz)
	}

	method esParcelaDisponible(){
		if(self.hayCultivoAca()){
			self.error("La parcela esta ocupada")
		}
	}

//-----------------------INTERACCIONES CON LA LISTA DE CULTIVOS SEMBRADOS POR EL PERSONAJE-------------------------
	
	method listaCultivosSembrados(){			// TRAE LA LISTA DE CULTIVOS QUE SE ENCUENTRA EN LA GRANJA
		return cultivos.listaDeCultivos() 
	}
	
	method hayCultivoAca() {					// INDICA si en la posicion actual hay algun cultivo sembrado
		return cultivos.hayCultivoEn(position)				
	}	
	
	method cultivoAca(){ 						// DEVUELVE el cultivo que se encuentra en la misma posicion del personaje
		return cultivos.cultivosEn(position)	//return self.listaCultivosSembrados().findOrDefault({cultivo => cultivo.position() == self.position()}, null)			
	}

	// ----------------ACCIONES DEL PERSONAJE---------------

	method regar() {
		if(not self.hayCultivoAca()){ 				// VERIFICA SI HAY UN CULTIVO EN LA POSICION ACTUAL
			self.error("no tengo nada para regar")
		}else{
			self.cultivoAca().serRegado()
		}
	}	


	method cosechar(){
		if(not self.hayCultivoAca()){ 				// VERIFICA SI HAY UN CULTIVO EN LA POSICION ACTUAL
			self.error("no tengo nada para cocechar")
		}else{
			self.cultivoAca().serCosechado()
			cultivos.agregarCosecha(self.hayCultivoAca())
		}	
	}

	method vender(){
		cultivos.VenderTotalDeCosecha()
		monedas.aculumarOro()
		game.say(self, "vendi" + cultivos.VenderTotalDeCosecha() + "monedas")
	}
}



object granja {
	const property listaDeCultivos = []
	const property listaDeCosechas = [] 

	method agregarCultivo(newCultivo){		//agrega cultivos a la lista de la granja
		listaDeCultivos.add(newCultivo)
	}

    method eliminarCultivo(cultivo) {		// Elimina un cultivo de la granja 
        listaDeCultivos.remove(cultivo)
    }

    method hayCultivoEn(posicion) {			// Indica si hay algún cultivo en la posición dada
        return listaDeCultivos.any({ cultivo => cultivo.position() == posicion })
    }

    method cultivosEn(posicion) {			// Devuelve todos los cultivos que se encuentran en la posicion dada
		return self.listaDeCultivos().findOrDefault({cultivo => cultivo.position() == posicion}, null)		//return listaDeCultivos.filter({ cultivo => cultivo.position() == posicion })
        
    }  

	method agregarCosecha(cosecha){
		listaDeCosechas.add(cosecha)
	}

    method totalCosechasDe(cosecha) {	
		return self.listaDeCosechas().findOrDefault({cultivo => cultivo == cosecha}, null)
	}  

	method oroOtenodoPor(cosecha){
		return self.listaDeCosechas().sum({ cultivo => cultivo.valor()})
	}

	method VenderTotalDeCosecha(){
		return self.oroOtenodoPor(Tomaco) + self.oroOtenodoPor(Maiz) + self.oroOtenodoPor(Trigo)

	}
}




object oro {
  var property oroAcumulado = 0

  method ganancias(masGanancias) {
	oroAcumulado += masGanancias
  } 

}