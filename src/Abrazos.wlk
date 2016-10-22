import EstadoDeAnimo.*

class AbrazoProlongado 
{
 	method abrazar(abrazador,abrazado) 
 	{
  		if (abrazado.leAtrae(abrazador)) 
  		{
  			abrazado.cambiarAnimo(soniador)
  		}
  		else 
  		{
   			abrazado.cambiarAnimo(incomodo)
  		}
 	}
}

class AbrazoComun 
{
 	method abrazar(abrazador,abrazado)
 	{
 		abrazador	.variarFelicidad(2)
 		abrazado	.variarFelicidad(4)
  	}
}