import Sims.*
import Abrazos.*
import FuentesDeInformacion.*

object fixture 
{	
	method UnSimNormal()
	{
		return self.UnSimBuenazoNormal()
	}
	
	method UnSimInteresadoNormal()
	{
		return new SimInteresado('M',20,100,[],'F',false)
	}
	
	method UnSimSuperficialNormal()
	{
		return new SimSuperficial('M',20,100,[],'F',false)
	}
	
	method UnSimBuenazoNormal()
	{
		return new SimBuenazo('M',20,100,[],'F',false)
	}
	
	method UnSimConSecretos()
	{
		var sim 	= self.UnSimNormal()
		var amigo1 	= self.UnSimNormal()
		var amigo2 	= self.UnSimNormal()

		sim.agregarConocimiento("conocimientoSecreto")

		sim.hacerAmigo(amigo1)
		sim.hacerAmigo(amigo2)
	
		return sim
	}
	
	method UnSimPeleadoNormal()
	{
		return new SimPeleado('M',20,100,[],'F',false)
	}
	
	method unAbrazoComun()
	{
		return new AbrazoComun()
	}
	
	method unAbrazoProlongado()
	{
		return new AbrazoProlongado()
	}
	
	method UnSimNormalFemenino()
 	{
 		return new SimInteresado('F',18,100,[],'M',false)
	}
	
	method UnSimSuperficialFemenino()
	{
		return new SimSuperficial('F',18,100,[],'M',false)
	}
	
	method UnSimBuenazoFemenino()
	{
		return new SimBuenazo('F',18,100,[],'M',false)
	}
	
	method UnSimPeleadoFemenino()
	{
		return new SimPeleado('F',18,100,[],'M',false)
	}
	
	method UnSimRico()
	{
		var sim  = new SimBuenazo('M',20,100,[],'F',false)
		sim.ganarDinero(1000000)
		return sim
	}
	
	method UnSimPobre() 
	{
		var sim  = new SimBuenazo('M',20,100,[],'F',false)
		sim.ganarDinero(1)
		return sim
	}
	
	method UnSimTriste() 
	{
		return new SimBuenazo('M',20,1,[],'F',false)
	}
	
	method UnSimTristeFemenino() 
	{
		return new SimBuenazo('F',18,1,[],'M',false)
	}
	
	method UnSimFeliz()
	{
		return new SimBuenazo('M',20,300,[],'F',false)
	}
	
	method unaRelacion()
 	{
		var unSimMasculino  = self.UnSimNormal()
		var unSimFemenino  = self.UnSimNormalFemenino()
		
		unSimMasculino.iniciarRelacion(unSimFemenino)
		
 		return unSimMasculino.relacion()
	}
 
 	method unSimJoven()
 	{
 		return new SimInteresado('M',15,100,[],'F',false)
 	}
 	
 	method unVimNormal()
 	{
 		return new SimBuenazo('M',20,100,[],'F',true)
 	}
 	
 	method libro4Cap()
 	{
 		var librito = new Libro()
 		librito.agregarCapitulo("Las manzanas son rojas")
 		librito.agregarCapitulo("Las frutillas son rojas")
 		librito.agregarCapitulo("Las peras son verdes")
 		librito.agregarCapitulo("Las bananas son amarillas")
 		return librito
 	}
 	
 	method libro1Cap()
 	{
 		var librito = new Libro()
 		librito.agregarCapitulo("Bob Patinio tiene pies grandes")
 		return librito
 	}
}