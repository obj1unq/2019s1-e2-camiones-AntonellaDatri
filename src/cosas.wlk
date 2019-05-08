object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){ return 1 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto(){ return 2 }
}
object paqueteDeLadrillos {
	var property cantLadrillos  
	method peso() { return 2 * cantLadrillos }
	method nivelPeligrosidad() { return 2 }
	method bulto(){ 
		if (cantLadrillos <= 100){
			return 1
		}
		else if ((cantLadrillos > 100 && cantLadrillos < 300)){
			return 2
		}
		else{
			return 3
		}
	}
}
object arenaAGranel {
	var property peso
	method nivelPeligrosidad() { return 1 }
	method bulto(){ return 1 }
}
object contenedorPortuario {
	var cosas = []
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method peso() {
		return 100 + cosas.sum({ unaCosa => unaCosa.peso() })
	}
	method nivelPeligrosidad() { 
		return cosas.max({unaCosa => unaCosa.nivelPeligrosidad()}).peso()
	}
	method bulto(){
		return 1 + cosas.sum({ unaCosa => unaCosa.bulto() })
	}
}
object residuosRadioactivos {
	var property peso
	method nivelPeligrosidad() { return 200 }
	method bulto(){ return 1 }
}
object embalajeDeSeguridad {
	var property contiene
	method peso() { return contiene.peso() }
	method nivelPeligrosidad() { return contiene.nivelPeligrosidad() / 2 }
	method bulto(){ return 2 }
}