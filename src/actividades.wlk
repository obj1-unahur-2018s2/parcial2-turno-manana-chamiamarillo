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
	
	method esRecomendable(_socio) {
		return (self.esInteresante() and 
			_socio.actividadQLeAtrae(self) 
			and not _socio.actividadRealizada().contains(self)
		)
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
	
	method esRecomendable(_socio) {
		return (_socio.edad().between(20,30))
	}
}

class TallerLiterario {
	var property registroLibrosTrabajados = #{}
	
	method agregarLibroTrabajado(_libro) {
		registroLibrosTrabajados.add(_libro)
	}
	
	method idioma() {
		return registroLibrosTrabajados.filter({ l => l.idioma()})
	}
	
	method diasActividad() {
		return (registroLibrosTrabajados.size() + 1)
	}
	
	method sirveBroncearse() {
		return false
	}
	
	method implicaEsfuerzo() {
		return ((registroLibrosTrabajados.any({ l => l.cantPaginas() > 500 })) or
			registroLibrosTrabajados.map({ a => a.autor() }).asSet().size() == 1 and
			registroLibrosTrabajados.size() > 1
		)
	}
	
	method esRecomendable(_socio) {
		return _socio.idiomaQHabla().size() > 1
		
	}
}

class Libro {
	var property cantPaginas
	var property idiomaLibro
	var property autor
}

