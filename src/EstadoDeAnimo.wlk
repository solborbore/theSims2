object soniador 
{
 	method efectoEstadoDeAnimo(sim)
 	{
  		sim.variarFelicidad(1000)
  		sim.eliminarConocimientos()
 	}
 	
 	method revertirEfecto(sim)
 	{
 		sim.variarFelicidad(-1000)
 		sim.agregarConocimientosPerdidos()
 	}
}

object incomodo 
{
 	method efectoEstadoDeAnimo(sim)
 	{
 	 	sim.variarFelicidad(-200)
 	}
 	
 	method revertirEfecto(sim)
 	{
 		sim.variarFelicidad(200)
 	}
}
