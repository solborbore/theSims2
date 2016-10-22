class Trabajo
{
	var sueldo
	var felicidadAfectada
	
	
	constructor(suel,feli)
	{
		sueldo 				= suel
		felicidadAfectada 	= feli
	}
		
	 method trabajar(sim)
 	{
  		sim.variarFelicidad(felicidadAfectada)
  		sim.ganarDinero(sueldo) 
 	}
}

class TrabajoCopado inherits Trabajo
{
 	constructor(sueldo, felicidad) = super(sueldo,felicidad)
}

class TrabajoAburrido inherits Trabajo
{
 	constructor(sueldo, felicidad) = super(sueldo,-felicidad)
}
// Preguntar a Miguel sobre N, en que instancia se definiría su valor? o viene previamente estipulado?
// Se asume N = 4 
// Si se lo pusieramos al construcstor cambiaria en todas las instancias de trabajos AburridosHastaLaMuerte
class TrabajoAburridoHastaLaMuerte inherits Trabajo
{
 	constructor(sueldo, felicidad) = super(sueldo,-felicidad * 4)
}

class TrabajoMercenario 
{
 	method trabajar(sim)
 	{
 		sim.ganarDinero(((sim.dinero())* 0.02)+ 100)
 	}
}

class TrabajoMercenarioSocial inherits TrabajoMercenario
{
	override method trabajar(sim)
	{
		super(sim)
		sim.ganarDinero(sim.cantidadAmigos())
	}
} 
