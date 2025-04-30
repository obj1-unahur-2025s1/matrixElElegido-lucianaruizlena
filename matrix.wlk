object neo {
    var energia = 100

    method energia() = energia

    method esElElegido() = true

    method saltar() {
        energia = energia * 0.5
    }

    method vitalidad() = energia * 0.10
  
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false 

    method esElElegido() = false
    method saltar() {
      vitalidad = vitalidad -1
      estaCansado = true
    }
    method estaCansado() = estaCansado
    method vitalidad() = vitalidad
}

object trinity {
    method esElElegido() = false
    method vitalidad() = 0
    method saltar() {}
}

object nave {
  const pasajeros = [neo,morfeo,trinity]

  method cantidadDePasajeros() = pasajeros.size()

  method pasajeroConMayorVitalidad() = pasajeros.max({pasajeros => pasajeros.vitalidad()})

  //Este no sé cómo hacerlo.
  method estaEquilibradaEnVitalidad() = pasajeros.all({pasajeros => !pasajeros.vitalidad() > pasajeros.vitalidad() * 2})

  method estaElElegidoEnLaNave() = pasajeros.any({pasajero => pasajero.esElElegido()})

  method chocar() {
    pasajeros.forEach({pasajeros => pasajeros.saltar()})
    pasajeros.clear()
  }
  method acelerar() {
    self.pasajerosSinElElegido().forEach({pasajeros => pasajeros.saltar()})
  }

  method pasajerosSinElElegido() = pasajeros.filter({pasajeros => !pasajeros.esElElegido()})
}