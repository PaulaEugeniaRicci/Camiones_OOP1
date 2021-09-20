object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object bumblebee {
	var transformadoEnAuto = true
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}
object paqueteLadrillos {
	var cantidad = 0
	method peso() { return 2 * cantidad }
	method nivelPeligrosidad() { return 2 }
	method setCantidad(num) { cantidad = num }
}
object arenaGranel {
	var peso
	method peso() {return peso}
	method nivelPeligrosidad() { return 1 }
	method setPeso(num) { peso = num }
}
object bateriaAntiaerea {
	var estaConMisiles = false
	method peso() { return if (estaConMisiles) {300} else {200} }
	method nivelPeligrosidad() { return if (estaConMisiles) {100} else {0} }
	method misiles() { estaConMisiles = not estaConMisiles }
}
object contenedor {
	const listaCosas = []
	method peso() {return listaCosas.sum( { unaCosa=> unaCosa.peso() } ) + 100 }
	method nivelPeligrosidad() { 
		return if (listaCosas.isEmpty()) { 0 }
		else { listaCosas.max( {unaCosa=> unaCosa.nivelPeligrosidad() } ).nivelPeligrosidad() }
	}
	method cargar(unaCosa){ listaCosas.add(unaCosa) }
	
	method descargar(unaCosa){ listaCosas.remove(unaCosa) }
}
object residuos {
	var peso
	method peso() {return peso}
	method nivelPeligrosidad() {return 200}
	method setPeso(num) { peso = num }
}
object embalaje {
	var objetoEnvuelto
	method peso() { return objetoEnvuelto.peso() }
	method nivelPeligrosidad() { return objetoEnvuelto.nivelPeligrosidad()/2 }
	method setObjetoEnvuelto(cosa) { objetoEnvuelto = cosa }
}

