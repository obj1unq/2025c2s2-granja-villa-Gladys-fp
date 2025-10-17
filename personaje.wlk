import wollok.game.*
import cultivos.*
import aspersor.*
import granja.*
import mercado.*



object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property monedas = monedaDeOro
	const cultivos = granja
	//const puestosDeVentas = mercado


//----------SIEMBRAS y ASPERSOR-------------
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
	method colocarAspersor(){
		self.esParcelaDisponible()
		const aspersor = new Aspersor()
		game.addVisual(aspersor)
		aspersor.position(self.position())
		aspersor.iniciarRiego()			
	}

//----------------------VALIDACIONES--------------------
	method esParcelaDisponible(){
		if(self.hayCultivoAca()){
			self.error("La parcela esta ocupada")
		}
	}
	method validarSiHayCultivoParaRegar(){
		if(not self.hayCultivoAca()){ 				// VERIFICA SI HAY UN CULTIVO EN LA POSICION ACTUAL
			self.error("no tengo nada para regar")
		}		
	}
	method validarSiHayCultivoParaCosechar(){
		if(not self.hayCultivoAca()){ 				// VERIFICA SI HAY UN CULTIVO EN LA POSICION ACTUAL
			self.error("no tengo nada para cocechar")
		}	
	}

//-----------------------INTERACCIONES CON LA LISTA DE CULTIVOS SEMBRADOS POR EL PERSONAJE-------------------------
	
	
	method hayCultivoAca() {					// INDICA si en la posicion actual hay algun cultivo sembrado
		return cultivos.hayCultivoEn(position)				
	}	
	method cultivoAca(){ 						// DEVUELVE el cultivo que se encuentra en la misma posicion del personaje
		return cultivos.cultivosEn(position)		
	}
	method monedasAcumuladas(){					//devuelve la cantidad total de monedas acumuladas
		return monedas.monedasAcumulasEnTotal()
	}
	method cultivosCosechados(){				//LISTA DE CULTIVOS COSECHADOS
		return cultivos.listaDeCosechas()
	}
	method valorTotalDeCosechas(){				// devuelve el valor de las cosechas obtenidas
		return cultivos.valorTotalDeCosecha()
	}
	method cultivosSembrados(){					//LISTA DE CULTIVOS SEMBRADOS
		return cultivos.listaDeCultivos()
	}
	method moverArriba(){						// Definido solo para el test
		position = position.up(1)
	}



	// ----------------ACCIONES DEL PERSONAJE---------------

	method regar() {
		self.validarSiHayCultivoParaRegar()
		self.cultivoAca().serRegado()
	}	
	method cosechar(){
		self.validarSiHayCultivoParaCosechar()
		cultivos.agregarCosecha(self.cultivoAca())
		self.cultivoAca().serCosechado() 
		cultivos.eliminarCultivo(self.cultivoAca())
	}
	method vender(){
		game.say(self, "vendi " + self.valorTotalDeCosechas() + " monedas")
		monedas.acumularMonedas(self.valorTotalDeCosechas())
		cultivos.venderTodasLasCosechas()
	}

	method informacionDeInventario(){
		game.say(self, "tengo " + self.monedasAcumuladas() + " monedas y " + cultivos.cantidadTotalDeCosechas() + " plantas para vender")
	}



}






object monedaDeOro {
	var  monedasAcumuladas = 0
	
	method monedasAcumulasEnTotal(){
		return monedasAcumuladas
	}
  
  	method acumularMonedas(masMonedas) {
		monedasAcumuladas += masMonedas
  	} 

}