import Trabajos.*
import Celos.*
import Relaciones.*

class Sim
{
	var sexo
	var edad
	var nivelFelicidad 	= 0
	var amigos 			= []
	var dinero			= 0
	var conocimientos 	= #{}
	var trabajo			= null
	var estadoDeAnimo
	var relacion		= null
	var sexoPreferencia
	//En Cuanto a la correccion "Con respecto a los conocimientos, falta la lógica que se encarga de que un sim no tenga conocimientos repetidos" habiamos implementado el uso de sets que justamente evita la repeticion. A eso te referias?
	var conocimientosPerdidos = #{}
	
	constructor(sex,ed,nFelicidad,amigs, sexPreferencia)
	{
		sexo 			= sex
		edad 			= ed
		nivelFelicidad 	= nFelicidad
		amigos 			= amigs
		sexoPreferencia = sexPreferencia
	}
	
	method valoracion(sim)
	method leAtrae(sim)
	
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
		return nivelFelicidad
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
		return conocimientos
	}
	
	method nivelFelicidad(felicidadNueva)
	{
		nivelFelicidad = felicidadNueva
	}
	

	method trabajo()
	{
		return trabajo 
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
		estado.efectoEstadoDeAnimo(self)
	}
	
	method hacerAmigo(nuevoAmigo)
	{
		amigos.add(nuevoAmigo)
		nivelFelicidad += self.valoracion(nuevoAmigo)
	}
	
	method trabajar()
	{
		if(trabajo != null)
			trabajo.trabajar(self)
		else
			error.throwWithMessage("Estoy desempleado")
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

	method agregarConocimientosPerdidos()
 	{	
  		conocimientos = conocimientosPerdidos
 	}	
 
 
 	method eliminarConocimientos() 
 	{ 
  		conocimientos.forEach({conoc => conocimientosPerdidos.add(conoc)})
  	 	conocimientos.clear()
 	}


	method eliminarAnimo(estado) 
 	{
  		estadoDeAnimo = null
  		estado.revertirEfecto(self)
 	}
 	  
 	method amigosViejos (){
   		return  amigos.take(4)
  	}
    
  	method amigosNuevos ()
  	{
   		return  (amigos.reverse()).take(4)
  	}
  	
  	method simMasPopular()
 	{
  		return amigos.max({amigo => self.popularidad()})
 	}
 	
 	method iniciarRelacion(otroSim)
 	{
 		return new Relacion(self, otroSim)
 	}
 	
 	method relacion(rela)
 	{
 		relacion = rela
 	}
 	
  	method terminarRelacion()
  	{
   		relacion.terminarRelacion()
	}
 	
 	method estaEnPareja()
 	{
 		return (relacion != null)
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
}


class SimInteresado inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	
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
	

}

class SimSuperficial inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	
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
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	
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
			}
			
			else 
		
			{
			error.throwWithMessage("Estoy desempleado")
			}
	}

}

class SimPeleado inherits Sim
{
		constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	
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