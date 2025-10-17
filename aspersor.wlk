import wollok.game.*
import personaje.*
import granja.*


class Aspersor {
	var property position = game.at(3, 7)
	var property image = "aspersor.png"
	const cultivos = granja


	method cultivoEn(direccion){ 						// DEVUELVE el cultivo que se encuentra en la direccion dada.
		return cultivos.cultivosEn(direccion)			
	}

	method hayCultivoAl(direccion) {					// INDICA si en la direccion dada hay algun cultivo sembrado
		return cultivos.hayCultivoEn(direccion)				
	}	

	method regarCultivosAl(direccion){					// RIEGA el cultivo en la direccion dada, si en la misma hay un cultivo.
		if(self.hayCultivoAl(direccion)){
			self.cultivoEn(direccion).serRegado()
		}		
	}

	method regarCultivos() {							// riega los cultivos que se encuentran en las direcciones dadas
		self.regarCultivosAl(self.parcelaAlNorte())
		self.regarCultivosAl(self.parcelaAlSur())
		self.regarCultivosAl(self.parcelaAlEste())
		self.regarCultivosAl(self.parcelaAlOeste())
	    self.regarCultivosAl(self.parcelaAlNoreste())
		self.regarCultivosAl(self.parcelaAlNoroeste())
		self.regarCultivosAl(self.parcelaAlSureste())
		self.regarCultivosAl(self.parcelaAlSuroeste())

	}

	method iniciarRiego(){								//PROGRAMA al aspersor para que riegue las plantas cada un segundo
		game.onTick(1000, "Regar las plantas", {self.regarCultivos()})
	}



//------------------DIRECCIONES  HACIA LA CUAL PUEDE REGAR-------------------------
	method parcelaAlNorte(){
		return game.at(self.position().x(), self.position().y() + 1)
	}
	method parcelaAlSur(){
		return game.at(self.position().x(), self.position().y() - 1)
	}
	method parcelaAlEste() {
		return game.at(self.position().x() + 1, self.position().y())
	}
	method parcelaAlOeste(){
		return  game.at(self.position().x() - 1, self.position().y())
	}

// -------------------DIRECCIONES DIAGONALES HACIA LA CUAL PUEDE REGAR-----------------------------
	method parcelaAlNoreste(){
		return game.at(self.position().x() + 1, self.position().y() + 1)
	}
	method parcelaAlNoroeste(){
		return game.at(self.position().x() - 1, self.position().y() + 1)
	}
	method parcelaAlSureste(){
		return game.at(self.position().x() + 1, self.position().y() - 1)
	}
	method parcelaAlSuroeste(){
		return game.at(self.position().x() - 1, self.position().y() - 1)
	}
}
