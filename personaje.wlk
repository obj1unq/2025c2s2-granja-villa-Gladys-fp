import wollok.game.*
import cultivos.*


object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property modedas = oro
	const cultivosSembrados = cultivos


	method listaCultivosSembrados(){
		return cultivosSembrados.listaDeCultivos()
	}

	method sembrar(cultivo) {
	  game.addVisual(cultivo)
	  cultivo.position(self.position())
	  cultivosSembrados.agregarCultivo(cultivo)
	}

	method hayCulticoAca() {
	  return self.listaCultivosSembrados().any({ self.position() == position.cultivo()})
	}	

	method cultivoAca(){
		return self.listaCultivosSembrados().find( {self.position() == position.cultivo()})
	}


	method regar() {
		if(not self.hayCulticoAca()){
			self.error("No hay un cultivo aca")
		}else{
			self.cultivoAca().serRegado()
		}
	}	





	method cocechar(cultivo) {
	  cultivo.cocechar()
	}

	method vender(cultivo) {
		modedas.ganancias(cultivo.valor())
	}
}



object cultivos {
	const property listaDeCultivos = []

	method agregarCultivo(newCultivo){
		listaDeCultivos.add(newCultivo)
	}
  
}

object oro {
  var property oroAcumulado = 0

  method ganancias(masGanancias) {
	oroAcumulado += masGanancias
  } 
}

object granero {
  var maizAlmacenado = 0
  var tomacoAlmacenado = 0
  var trigoAlmacenado = 0

  method almacenarTrigo(cantAlmacenar) {
	maizAlmacenado += cantAlmacenar
  }
}