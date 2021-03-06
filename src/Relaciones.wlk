import Trabajos.*
import Celos.*
import Relaciones.*

class Relacion
{
	var miembro1
	var miembro2
	var vigente = false
	
	constructor(unSim, otroSim)
	{
		if(self.puedenIniciarRelacion(unSim,otroSim))
			self.iniciarRelacion(unSim,otroSim)
		else
			error.throwWithMessage("No se puede iniciar la relacion, un sim es menor a 16 o ya tiene pareja")
	}
	
	method puedenIniciarRelacion(unSim, otroSim)
	{
		return unSim.puedeIniciarRelacion() && otroSim.puedeIniciarRelacion()
	}

	
	method circuloDeAmigos() {
		return #{miembro1.amigos(),miembro2.amigos()}.flatten()
	}
	
	method vigente()
	{
		return vigente
	}
	
	method iniciarRelacion(unSim, otroSim)
	{
		miembro1 = unSim
		miembro2 = otroSim
				
		self.vincularSims()
		
		vigente = true
	}
	
	method vincularSims()
	{
		var miembros = [miembro1, miembro2]
		
		miembros.filter({miembro => miembro.estaEnPareja()}).forEach({miembro => miembro.terminarRelacion()})
		miembros.forEach({miembro => miembro.relacion(self)})
	}
	
	
	method terminarRelacion()
	{	
  		miembro1.relacion(soltero)
  		miembro2.relacion(soltero)
		vigente = false
	}
	
	method reiniciarRelacion()
	{
		self.vincularSims()
		vigente = true
	}
	
	
	method laRelacionFunciona()
	{
		return (self.seAtraen(miembro1, miembro2))
	}
	
	method seAtraen(unSim, otroSim)
	{
		return unSim.leAtrae(otroSim) && otroSim.leAtrae(unSim)
	}
	
	method sePudreTodo()
	{
		return !self.laRelacionFunciona() && self.leGustaElAmigo()
	}
	
	method leGustaElAmigo()
	{
		return self.aUnoLeGustaElAmigo(miembro1) || self.aUnoLeGustaElAmigo(miembro2)
	}
	
	method aUnoLeGustaElAmigo(unSim)
	{
		return self.circuloDeAmigos().any({amigo => unSim.leAtrae(amigo)})
	}
	
	method parejaDe(miembro)
	{
		return miembro.pareja()
	}
	
	 method miembros()
 	{
  		return [miembro1,miembro2]
 	}
}
object soltero{}