import pajaros.*
class Isla {	
	const property avesEnLaIsla = []

	const property alpisteEnIsla = new Alpiste()
	
	const property maizEnIsla = new Maiz()
	
	method agregarAve(ave){
		avesEnLaIsla.add(ave)
	}
	
	method cantidadDeAlpiste(){
		return self.alpisteEnIsla().cantidad()
	}
	
	method cantidadDeMaiz(){
		return self.maizEnIsla().cantidad()
	}

	method avesDebiles(){
		return avesEnLaIsla.filter({i => i.esDebil()})
	}

	method fuerzaTotalDeLaIsla(){
		return avesEnLaIsla.sum({i=>i.fuerza()})
	}

	method esRobusta(){
		return avesEnLaIsla.all({i=>i.esRobusta()})
	}

	method terremoto(){
		avesEnLaIsla.forEach({i=>i.recibirUnDisgusto()})
	}

	method tormenta(){
		self.avesDebiles().forEach({i=>i.recibirUnDisgusto()})
	}

	method aveCapitana(){
		return avesEnLaIsla.filter({i=>i.fuerza().between(1000,3000)}).max({j=>j.fuerza()})
	}

	method sesionRelax(){
		avesEnLaIsla.forEach({i=> i.relajar()})
	}

	method avesMasFuerteQue_(ave){
		return avesEnLaIsla.filter({i=>i.fuerza() > ave.fuerza() })
	}

	method hayPaz(){
		return avesEnLaIsla.all({i=> i.estaConformeConLaIsla(self)})
	}
	
	method alimentacion(){
		avesEnLaIsla.forEach({i=> i.consumirAlimento(self)})
	}
}

class Alpiste{
	var cantidad = 10
	
	method cantidad(){
		return cantidad
	}
	
	method aumentarCantidad(cantidadAumentada){
		cantidad =+ cantidadAumentada
	}

	method disminuirCantidad(cantidadDisminuida){
		cantidad =- cantidadDisminuida
	}
}
class Maiz{
	var cantidad = 10
	
	method cantidad(){
		return cantidad
	}
	
	method aumentarCantidad(cantidadAumentada){
		cantidad =+ cantidadAumentada
	}

	method disminuirCantidad(cantidadDisminuida){
		cantidad =- cantidadDisminuida
	}
}