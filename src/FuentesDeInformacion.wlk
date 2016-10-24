import Sims.*
import fixture.*

object tinelli
{
	method brindarInformacion(unSim)
	{
		return "Totó"
	}
}

object rial
{
	method brindarInformacion(unSim)
	{
		return "Escándalo"
	}
}

class Libro
{
	//el contenido es una lista, con el contenido que tiene cada capitulo
	var contenido = []
	
	method contenido()
	{
		return contenido
	}
	
	method agregarCapitulo(cont)
	{
		contenido.add(cont)
	}
	
	method brindarInformacion(unSim)
	{
		unSim.agregarConocimiento(self.capAlAzar())
	}
	
	method capAlAzar()
	{
		return contenido.anyOne()
	}
	
}