import actividades.*

class Socio {
	var property actividadRealizada = #{}
	var property maximoActividades
	var property edad
	var property idiomaQHabla = #{}
	
	method agregarActividad(_actividad) {
		actividadRealizada.add(_actividad)
	}
	
	method adoradorDelSol() {
		return (actividadRealizada.all({ a => a.sirveBroncearse() }))
	}
	
	method realizaActividad(_actividad) {
		if (actividadRealizada.size() < maximoActividades)
		{
			self.agregarActividad(_actividad)
		}
		else
		{
			self.error("no puede realizar esta actividad")
		}
	}
	
	method implicaEsfuerzo() {
		return actividadRealizada.filter({ a => a.implicaEsfuerzo() })
	}
	
	method agregarIidioma(_idioma) {
		idiomaQHabla.add(_idioma)
	}
	
	method actividadQLeAtrae(_actividad)
}

class SocioTranquilo inherits Socio {
	
	override method actividadQLeAtrae(_actividad) {
		return (_actividad.diasActividad() >= 4 )
	}
}

class SocioCoherente inherits Socio {
	
	override method actividadQLeAtrae(_actividad) {
		if (self.adoradorDelSol())
		{
			return (_actividad.sirveBroncearse())
		}
		else
		{
			return (_actividad.sirveBroncearse())
		}
	}
	
}

class SocioRelajado inherits Socio {
	
	override method actividadQLeAtrae(_actividad) {
		return (_actividad.idioma().intersection(idiomaQHabla).size() > 0)
	}	
}