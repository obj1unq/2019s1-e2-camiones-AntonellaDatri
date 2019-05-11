import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	method cargar(unaCosa) {
		unaCosa.cambiar()
		cosas.add(unaCosa)
	}
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method pesoTotal(){
		return tara + cosas.sum({unaCosa => unaCosa.peso()})
	}
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	method objetosPeligrosos(nivel){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({ unaCosa => unaCosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({unaCosa => unaCosa.peso() <= max && unaCosa.peso() >= min })
	}
	method cosaMasPesada(){
		return cosas.max({unaCosa => unaCosa.peso()})
	}
	method totalBultos(){
		return cosas.sum({unaCosa => unaCosa.bulto()})
	}
	method pesos(){
		return cosas.map({unaCosa => unaCosa.peso()})
	}


}

