import Trabajos.*
import Celos.*
import Relaciones.*
import fixture.*
import EstadoDeAnimo.*

class Sim
{
	var sexo
	var edad
	var nivelFelicidad 	= 0
	var amigos 			= []
	var dinero			= 0
	var conocimientos 	= #{}
	var trabajo			= desocupado
	var estadoDeAnimo	= neutral
	var relacion		= soltero
	var sexoPreferencia
	var fuentesDeInformacion = #{}
	var pareja
	var esVim 
	
	/* Creamos el atributo esVim para asi poder instanciar por el constructor si es un sim o un vim.
	 * En el caso de que lo sea, el metodo cumplir años va a actuar diferente. De esta manera se
	 * evita la repeticion de logica que se generaria en el caso de hacer una clase vim para cada
	 * tipo de sim que existe. En el caso de modificar la version y necesitar que los sims se puedan
	 * convertir en vims y viceversa, crearimos un metodo morder que cambie el valor del 
	 * atributo esVim */
	
	constructor(sex,ed,nFelicidad,amigs, sexPreferencia,vim)
	{
		sexo 			= sex
		nivelFelicidad 	= nFelicidad
		amigos 			= amigs
		sexoPreferencia = sexPreferencia
		esVim			= vim
		if (esVim){
			edad = 18
		} else{
			edad = ed
		}
		
	}
	
	method pareja (){
		return pareja
	}
	
	method valoracion(sim)
	method leAtrae(sim)
	
	method edad()
	{
		return edad
	}
	
	method mayorA16anios()
	{
		return edad > 16
	}
	
	method puedeIniciarRelacion()
	{
		return !self.estaEnPareja() && self.mayorA16anios()
	}
	
	method leAtraen(unosSims) 
	{
		return unosSims.filter({unSim => self.leAtrae(unSim)})
	}
	
	method simMasValorado()
	{
		return amigos.max({amigo => self.valoracion(amigo)})
	}
	
	method estadoDeAnimo()
	{
		return estadoDeAnimo
	}
	
	method nivelFelicidad()
	{
		return nivelFelicidad + estadoDeAnimo.felicidad()
	}
	
	method dinero()
	{
		return dinero
	}
	
	method amigos()
	{
		return amigos
	}
	
	method sexo()
	{
		return sexo
	}
	
	method  popularidad ()
	{
 		return amigos.sum({sim => sim.nivelFelicidad()})
	}
	
	method conocimientos()
	{
		if (estadoDeAnimo == soniador) {return #{} } else {
			return conocimientos
		}
	}
	
	method nivelFelicidad(felicidadNueva)
	{
		nivelFelicidad = felicidadNueva
	}
	

	method trabajo()
	{
		return trabajo 
	}
	
	method loConoce(unConocimiento)
	{
		return conocimientos.any({conocimiento => conocimiento == unConocimiento})
	}
	
	method difundirConocimiento(unConocimiento)
	{
		if(!self.loConoce(unConocimiento))
		{
			self.agregarConocimiento(unConocimiento)
			self.enseniarAAmigos(unConocimiento)
		}
	}

	method conocimientoPrivado(unConocimiento)
	{
		return  self.loConoce(unConocimiento) && self.ningunAmigoLoConoce(unConocimiento)
	}
	
	method primerConocimientoPrivado()
	{
		if(conocimientos.any({conocimiento => self.conocimientoPrivado(conocimiento)}))
			return conocimientos.find({conocimiento => self.conocimientoPrivado(conocimiento)})
		else
			return null
	}
	
	method unChisme()
	{
		return self.primerConocimientoPrivado()
	}

	method desparramarChisme(simAfectado)
	{
		if(simAfectado.unChisme() != null)
			self.difundirConocimiento(simAfectado.unChisme())
		else
			error.throwWithMessage("El sim afectado no tiene secretos")
	}

	method ningunAmigoLoConoce(unConocimiento)
	{
		return amigos.all({amigo => !amigo.loConoce(unConocimiento)})
	}
	
	method enseniarAAmigos(unConocimiento)
	{
		amigos.forEach({amigo => amigo.agregarConocimiento(unConocimiento)})
	}
	
	method brindarConocimiento(unSim)
	{
		unSim.agregarConocimiento(self.primerConocimientoPrivado())
	}
	
	method agregarConocimiento(unConocimiento)
	{
  		conocimientos.add(unConocimiento)
	}
	
	method amnesia() 
	{
 		conocimientos.clear()
	}
	
	method suPreferencia(sim)
	{
		return sim.sexo() == sexoPreferencia
	}
	
	method esJoven()
	{
		return 18 <= edad && edad <= 29
	}
	
	method masPopularQue(popularidad)
	{
		return self.popularidad() > popularidad
	}
	
	method estaTriste()
	{
		return nivelFelicidad < 200
	}
	
	method cambiarAnimo(estado)
	{
		estadoDeAnimo= estado
	}
	
	method hacerAmigo(nuevoAmigo)
	{
		amigos.add(nuevoAmigo)
		nivelFelicidad += self.valoracion(nuevoAmigo)
	}
	
	method trabajar()
	{
		if(trabajo != desocupado){
			trabajo.trabajar(self)
			estadoDeAnimo = neutral}
			
		else {
			error.throwWithMessage("Estoy desempleado")
	}
	}
	
	method abrazar(sim, abrazo)
	{
		abrazo.abrazar(self, sim)
	}

	
	method variarFelicidad(unaFelicidad) 
	{
 		nivelFelicidad 	+= unaFelicidad
	}

	method ganarDinero(ganancia) 
	{
 		dinero 			+= ganancia
	}
	
	 method	dineroDeAmigos()
 	{
 		return amigos.sum({sim => sim.dinero()})
 	}
 	
 	method AsignarTrabajo(trabajoNuevo)
 	{
 		trabajo = trabajoNuevo
 	}

	method nivelDeConocimientos()
    {
    	return conocimientos.map({conocimiento => conocimiento.size()}).sum()
    }

	method amigoMasPopular(amigo)
 {	
  	return self.popularidad() > amigo.popularidad() 
 		}

	method amigoTieneMasDinero(amigo)
 	{
  		return dinero > amigo.dinero()
 	}
 	
 	method eliminarAmigosDePareja()
 	{
 		self.eliminarAmigosPorCriterio({amigo => !self.amigoDePareja(amigo)})
 	}
 	
 	method amigoDePareja(amigo)
 	{
 		return relacion.parejaDe(self).amigos().contains(amigo)
 	}
 	
 	method eliminarAmigosPorCriterio(bloque)
 	{
 		amigos = amigos.filter(bloque)
 	}
 	
 	method ataqueDeCelos(celos)
 	{
 		celos.ponerCeloso(self)
 	}


	method eliminarAnimo() 
 	{
 		estadoDeAnimo = neutral
 	}
 	  
 	method amigosViejos ()
 	{
   		return  amigos.take(4)
  	}
    
  	method amigosNuevos ()
  	{
   		return  (amigos.reverse()).take(4)
  	}
  	
  	method cantidadAmigos()
  	{
  		return amigos.size()
  	}
  	
  	method simMasPopular()
 	{
  		return amigos.max({amigo => self.popularidad()})
 	}
 	
 	method iniciarRelacion(otroSim)
 	{
 		pareja = otroSim
 		return new Relacion(self, otroSim)
 		
 	}
 	
 	method relacion(rela)
 	{
 		relacion = rela
 	}
 	
  	method terminarRelacion()
  	{
   		relacion.terminarRelacion()
   		pareja = soltero
	}
 	
 	method estaEnPareja()
 	{
 		return (relacion != soltero)
 	}
 	
 	method relacion()
 	{
 		return relacion
 	}
 	
 	method reiniciarRelacion(rela)
 	{
 	 	if(rela.miembros().contains(self) && !rela.vigente())
 	 	{
 	 		rela.reiniciarRelacion()
 	 	}
 	 	else if(!rela.miembros().contains(self))
 	 	{
 	 		error.throwWithMessage("esta relacion no pertenece a este sim")
 	 	}
 	 	else
 	 	{
 	 		error.throwWithMessage("esta relacion esta vigente")
 	 	}
 	}
 	 
 	method lePresta(cantidad,otroSim)
 	{
 		if(dinero >= cantidad && self.montoMaximoAPrestarle(otroSim) > cantidad)
 		{
 			otroSim.ganarDinero(cantidad)
 		}
 		else
 		{
 			error.throwWithMessage("No le presta dinero")
 		}
 		
 	}
 	
	method montoMaximoAPrestarle(otroSim)
 	{
 		return self.valoracion(otroSim) * 10
 	}
 	
 	method cumplirAnios()
 	{
 		if (esVim)
 		{
 			error.throwWithMessage("Los vims no pueden cumplir anios")
 		}
 		edad += 1
 	}
 	
 	method amigoAlAzar()
 	{
 		return amigos.anyOne()
 	}
 	
 	method brindarInformacion(unSim)
 	{
 		unSim.agregarConocimiento(self.amigoAlAzar().unChisme())
 	}
 	
 	method agregarFuenteDeInformacion(fuente)
 	{
 		fuentesDeInformacion.add(fuente)
 		fuente.brindarInformacion(self)
 	}

}

class SimInteresado inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia,vim) = super(sex,ed,nFelicidad,amigs,sexPreferencia,vim)
	
	override method valoracion(sim) 
	{
  		return sim.dineroDeAmigos() * 0.1
 	}
 	
 	override method leAtrae(sim)
	{
		return self.suPreferencia(sim) && self.duplicaSuFortuna(sim)
	}
	
	method duplicaSuFortuna(sim)
	{
		return sim.dinero() >= self.dinero() * 2
	}
	
	override method lePresta(cantidad,otroSim)
	{
		if(dinero >= cantidad && self.montoMaximoAPrestarle(otroSim) > cantidad && otroSim.dinero() >= cantidad)
 		{
 			otroSim.ganarDinero(cantidad)
 		}
 		else
 		{
 			error.throwWithMessage("No le presta dinero")
 		}
	}

}

class SimSuperficial inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia,vim) = super(sex,ed,nFelicidad,amigs,sexPreferencia,vim)
	
	override method valoracion(sim)
	{
		return 20 * sim.popularidad()
	}
	
	override method leAtrae(sim)
	{
		return self.suPreferencia(sim) && self.masPopularQueAmigos(sim) && sim.esJoven() 
	}
	
	method masPopularQueAmigos(sim)
	{
		return sim.popularidad() >= self.simMasPopular().popularidad()
	}
}

class SimBuenazo inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia,vim) = super(sex,ed,nFelicidad,amigs,sexPreferencia,vim)
	
	override method simMasValorado()
	{
		return null
	}
	
	override method valoracion(sim)
	{
		return nivelFelicidad/2
	}
	
	override method leAtrae(sim)
	{
		return self.suPreferencia(sim)
	}
	
	override method trabajar()
	{
		if(trabajo != null) {
			
			if (amigos.all({amigo=> amigo.trabajo() == self.trabajo()})) {
				self.variarFelicidad(self.nivelFelicidad() * 0.1) }
			trabajo.trabajar(self)
			if( estadoDeAnimo != neutral){
			self.eliminarAnimo()
			}
			}
			
			
			else 
		
			{
			error.throwWithMessage("Estoy desempleado")
			}
	}

}

class SimPeleado inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia,vim) = super(sex,ed,nFelicidad,amigs,sexPreferencia,vim)
	
	override method simMasValorado()
	{
		return null
	}

	override method valoracion(sim)
	{
		return 0
	}
	
	override method leAtrae(sim)
	{
		return self.suPreferencia(sim) && sim.estaTriste()
	}
}