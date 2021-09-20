import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa){ cosas.add(unaCosa) }
	
	method descargar(unaCosa){ cosas.remove(unaCosa) }
	
	method todoPesoPar(){ return cosas.all( { cosa => cosa.peso() % 2 == 0 } ) } 
	
	method hayAlgunoQuePesa(peso){ return cosas.any( { cosa => cosa.peso() == peso} ) }
	
	method elDeNivel(nivel){ return cosas.filter( {cosa => cosa.nivelPeligrosidad() == nivel}).first() }
	
	method pesoTotal(){ return cosas.sum( { cosa => cosa.peso() } )+ 1000 }
	
	method excedidoDePeso(){ return self.pesoTotal()> 2500}
	
	method objetosQueSuperanPeligrosidad(nivel){ return cosas.filter( { cosa=> cosa.nivelPeligrosidad()>nivel } ) }
	
	method objetosMasPeligrososQue(cosa){ return cosas.filter( { otraCosa=>otraCosa.nivelPeligrosidad()> cosa.nivelPeligrosidad() } ) }
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){ 
		return self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	method tieneAlgoQuePesaEntre(min, max){ 
		return cosas.any ( { cosa => cosa.peso().between(min, max) } )
	}
	
	method cosaMasPesada(){ return cosas.max( {cosa=> cosa.peso() } )}
	
	method pesos() { return cosas.map( {cosa=>cosa.peso() } ) }
	
}
