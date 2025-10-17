import wollok.game.*
import personaje.*


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
		return self.listaDeCultivos().findOrDefault({cultivo => cultivo.position() == posicion}, null)	  
    }  

	method agregarCosecha(cosecha){
		listaDeCosechas.add(cosecha)
	}

	method valorTotalDeCosecha(){
		return self.listaDeCosechas().sum({ cultivo => cultivo.valor()})
	}

	method venderTodasLasCosechas(){
		self.listaDeCosechas().clear()
	}

	method cantidadTotalDeCosechas(){
		return self.listaDeCosechas().size()
	}

}
