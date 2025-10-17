import wollok.game.*
import cultivos.*
import aspersor.*
import granja.*
import personaje.*




class Mercado {
    var property position = null
    var property monedasDisponibles = 0
    var property mercaderia = []
    var property image = "market.png"

    method puedeComprar(valor) {
        return monedasDisponibles >= valor 
    }

    method comprarCultivosA(vendedor){
        if(self.puedeComprar(vendedor.valorTotalDeCosechas())){
            monedasDisponibles -= vendedor.valorTotalDeCosechas()
            mercaderia.addAll(vendedor.cultivosCosechados())
            vendedor.vender()
        }else{
            self.error("El mercado no tiene suficientes monedas")
        }
    }
}

  const mercado1 = (new Mercado(position=game.at(0,9),monedasDisponibles = 1000))
  const mercado2 = (new Mercado(position=game.at(9,0),monedasDisponibles = 1500))
