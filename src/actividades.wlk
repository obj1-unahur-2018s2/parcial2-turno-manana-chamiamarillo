import socios.*

class Viaje {
	var property idioma = #{}
	
	method agregarIdioma(_idioma) {
		idioma.add(_idioma)
	}
	
	method diasActividad()
	method implicaEsfuerzo()
	method sirveBroncearse()
	method esInteresante() {
		return (idioma.size() > 2)
	}
}

class ViajeDePlaya inherits Viaje {
	var property largoPlaya
	
	override method diasActividad() {
		return (self.largoPlaya() / 500)
	}
	
	override method implicaEsfuerzo() {
		return (self.largoPlaya() > 1200)
	}
	
	override method sirveBroncearse() {
		return true
	}
}

class ExcurcionCiudad inherits Viaje {
	var property atraccionesAVisitar
	
	override method diasActividad() {
		return (self.atraccionesAVisitar() / 2)
	}
	
	override method implicaEsfuerzo() {
		return (self.atraccionesAVisitar().between(5,8))
	}
	
	override method sirveBroncearse() {
		return false
	}
	
	override method esInteresante() {
		return (super() or (self.atraccionesAVisitar() == 5))
	}
}

class ExcurcionCiudadTropical inherits ExcurcionCiudad {
	
	override method diasActividad() {
		return super() + 1
	}
	
	override method sirveBroncearse() {
		return true
	}
}

class Trekking inherits Viaje {
	var property kmsSendero
	var property diasSol
	
	override method diasActividad() {
		return (self.kmsSendero() / 50)
	}
	
	override method implicaEsfuerzo() {
		return (self.kmsSendero() > 80)
	}
	
	override method sirveBroncearse() {
		return (self.diasSol() > 200 or (
			self.diasSol().between(100,200) and self.kmsSendero() > 120
		))
	}
	
	override method esInteresante() {
		return (super() and (self.diasSol() > 140))
	}
}

class Gimnasia {
	var property idioma = #{"español"}
	
	method diasActividad() {
		return 1
	}
	method implicaEsfuerzo() {
		return true
	}
	method sirveBroncearse() {
		return false
	}
	method esInteresante()
	
}




