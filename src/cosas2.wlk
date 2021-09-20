object knightRider {
	method sufrirCambios(){}
	method cantBultos() {return 1}
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object bumblebee {
	var transformadoEnAuto = true
	method sufrirCambios() {transformadoEnAuto = false}
	method cantBultos() {return 2}
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}
object paqueteLadrillos {
	var cantidad = 0
	method sufrirCambios() {cantidad += 12}
	method cantBultos() {
		return if (cantidad<=100) {1} 
		else if (cantidad>100 and cantidad<=300) {2}
		else {3}
	}
	method peso() { return 2 * cantidad }
	method nivelPeligrosidad() { return 2 }
	method setCantidad(num) { cantidad = num }
}
object arenaGranel {
	var peso
	method sufrirCambios() {peso += 20}
	method cantBultos() {return 1}
	method peso() {return peso}
	method nivelPeligrosidad() { return 1 }
	method setPeso(num) { peso = num }
}
object bateriaAntiaerea {
	var estaConMisiles = false
	method sufrirCambios() {estaConMisiles = true}
	method cantBultos() { return if (estaConMisiles) {2} else {1} }
	method peso() { return if (estaConMisiles) {300} else {200} }
	method nivelPeligrosidad() { return if (estaConMisiles) {100} else {0} }
	method misiles() { estaConMisiles = not estaConMisiles }
}
object contenedor {
	const listaCosas = []
	
	method sufrirCambios(){
		listaCosas.forEach({unaCosa => unaCosa.sufrirCambios()})
	}
	method cantBultos() {
		return listaCosas.sum({unaCosa => unaCosa.cantBultos()}) + 1
	}
	
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
	method sufrirCambios() {peso += 15}
	method cantBultos() {return 1}
	method peso() {return peso}
	method nivelPeligrosidad() {return 200}
	method setPeso(num) { peso = num }
}
object embalaje {
	var objetoEnvuelto
	method sufrirCambios() {}
	method cantBultos() {return 2}
	method peso() { return objetoEnvuelto.peso() }
	method nivelPeligrosidad() { return objetoEnvuelto.nivelPeligrosidad()/2 }
	method setObjetoEnvuelto(cosa) { objetoEnvuelto = cosa }
}

