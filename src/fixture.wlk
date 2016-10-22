import Sims.*
import Abrazos.*

object fixture 
{	
	method UnSimNormal()
	{
		return self.UnSimBuenazoNormal()
	}
	
	method UnSimInteresadoNormal()
	{
		return new SimInteresado('M',20,100,[],'F')
	}
	
	method UnSimSuperficialNormal()
	{
		return new SimSuperficial('M',20,100,[],'F')
	}
	
	method UnSimBuenazoNormal()
	{
		return new SimBuenazo('M',20,100,[],'F')
	}
	
	method UnSimPeleadoNormal()
	{
		return new SimPeleado('M',20,100,[],'F')
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
 		return new SimInteresado('F',18,100,[],'M')
	}
	
	method UnSimSuperficialFemenino()
	{
		return new SimSuperficial('F',18,100,[],'M')
	}
	
	method UnSimBuenazoFemenino()
	{
		return new SimBuenazo('F',18,100,[],'M')
	}
	
	method UnSimPeleadoFemenino()
	{
		return new SimPeleado('F',18,100,[],'M')
	}
	
	method UnSimRico()
	{
		var sim  = new SimBuenazo('M',20,100,[],'F')
		sim.ganarDinero(1000000)
		return sim
	}
	
	method UnSimPobre() 
	{
		var sim  = new SimBuenazo('M',20,100,[],'F')
		sim.ganarDinero(1)
		return sim
	}
	
	method UnSimTriste() 
	{
		return new SimBuenazo('M',20,1,[],'F')
	}
	
	method UnSimTristeFemenino() 
	{
		return new SimBuenazo('F',18,1,[],'M')
	}
	
	method UnSimFeliz()
	{
		return new SimBuenazo('M',20,300,[],'F')
	}
	
	method unaRelacion()
 	{
		var unSimMasculino  = self.UnSimNormal()
		var unSimFemenino  = self.UnSimNormalFemenino()
		
		unSimMasculino.iniciarRelacion(unSimFemenino)
		
 		return unSimMasculino.relacion()
	}
 
}