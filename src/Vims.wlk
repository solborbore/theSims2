import Sims.*

class VimInteresado inherits SimInteresado
{
	constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	{
		edad = 18
	}
	
	override method cumplirAnios() {}
}

class VimSuperficial inherits SimSuperficial
{
	constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	{
		edad = 18
	}
	
	override method cumplirAnios() {}
}

class VimBuenazo inherits SimBuenazo
{
	constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	{
		edad = 18
	}
	
	override method cumplirAnios() {}
}

class VimPeleado inherits SimPeleado
{
	constructor(sex,ed,nFelicidad,amigs,sexPreferencia) = super(sex,ed,nFelicidad,amigs,sexPreferencia)
	{
		edad = 18
	}
	
	override method cumplirAnios() {}
}

/* Un sim y un Vim son muy parecidos, el vim tiene 18 años y nunca envejece, pero aun asi son clases diferentes.
 * Para hacer que un Vim pueda contagiar Sims mordiendolos, habria que unir las clases ya que un objeto no puede
 * nunca cambiar de clase.
 * Para esto, haria solo la clase Sim, con unos pequeños cambios:
 * Una variable booleana llamada "Factor Vim", con positivo si es un Vim y negativo si es un Sim. 
 * Un metodo del sim que sea mordido por un vim, lo que hace que su edad sea 18, y el factor vim sea positivo.
 * El metodo cumplirAnios dependera del factor vim, si es negativo cumple años, pero si es positivo no hace nada
 */