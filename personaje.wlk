import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const property modedas = oro
	const listaDecultivos = cultivos


	method positionCultivos(){
		return listaDecultivos.cultivosSembrados()
	}

	method sembrar(cultivo) {
	  game.addVisual(cultivo)
	  cultivo.position(self.position())
	  listaDecultivos.agregarCultivo(cultivo)
	}

	method hayCulticoAca() {
	  return self.positionCultivos().any({ self.position() == position.cultivo()})
	}	


	method regar() {
		if(self.hayCulticoAca()){
			


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
	const property cultivosSembrados = []

	method agregarCultivo(newCultivo){
		cultivosSembrados.add(newCultivo)
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