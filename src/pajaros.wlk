import islas.*
class Pajaros {

	method esDebil() {
		return self.fuerza() < 1000
	}

	method esRobusta() {
		return self.fuerza() > 300
	}

	method fuerza(){return 0}

	method recibirUnDisgusto()
	
	method relajar()
	
	method estaConformeConLaIsla(isla)

method consumirAlimento(isla) 
	//TODO: Código autogenerado 


}

class Aguilucho inherits Pajaros {

	var property velocidad = 20

	override method fuerza() {
		if (self.velocidad() <= 60) {
			return 180
		} else {
			return self.velocidad() * 3
		}
	}

	override method recibirUnDisgusto() {
		self.velocidad(self.velocidad() * 2)
	}

	override method relajar(){
		self.velocidad(self.velocidad()-10)
	}

	override method estaConformeConLaIsla(isla){
		return isla.cantidadDeAlpiste()>= 8
	}
	
	override method consumirAlimento(isla){
		isla.alpisteEnIsla().disminuirCantidad(3)
		self.velocidad(self.velocidad()+15)
		
	}
}

class Albatros inherits Pajaros {

	var property peso = 4000
	var property masaMuscular = 600

	override method fuerza() {
		if (self.peso() < 6000) {
			return self.masaMuscular()
		} else {
			return self.masaMuscular() / 2
		}
	}

	override method recibirUnDisgusto() {
		self.peso(self.peso() + 800)
	}

	method irAlGimnasio() {
		self.peso(self.peso() + 500)
		self.masaMuscular(self.masaMuscular() + 500)
	}

	override method relajar(){
		self.peso(self.peso() - 300)
	}

	override method estaConformeConLaIsla(isla){
		return isla.avesMasFuerteQue_(self).size() <= 2
	}
	
	override method consumirAlimento(isla){
		isla.maizEnIsla().disminuirCantidad(4)
		self.peso(self.peso() + 700)
		self.masaMuscular(self.masaMuscular() +700)
	}
}

class Palomas inherits Pajaros {

	var property ira = 200

	override method fuerza() {
		return self.ira() * 2
	}

	override method recibirUnDisgusto() {
		self.ira(self.ira() + 300)
	}

	override method relajar(){
		self.ira(self.ira() - 50)
	}
	
	override method estaConformeConLaIsla(isla){
		return isla.avesDebiles().size() <= 1
	}
	
	override method consumirAlimento(isla){}

	method equilibrarse(){
		if(self.fuerza() <= 700){
			self.recibirUnDisgusto()
		}else{
			self.relajar()
		}
	}
}

class AguiluchoClorado inherits Aguilucho {

	override method fuerza() {
		return super() + 400
	}

}

class PalomaTorcaza inherits Palomas {

	var property huevos = 3

	override method recibirUnDisgusto() {
		super()
		self.huevos(self.huevos() + 1)
	}

}

class PalomaMontera inherits Palomas {
	var property limiteDeFuerza = 2000
	
	method cambiarLimite(nuevoLimite){
		self.limiteDeFuerza(nuevoLimite)
	}

	override method fuerza(){
		return super().min(self.limiteDeFuerza())
	}
}

class PalomaManchada inherits Palomas{
	const property nidos = []

	override method recibirUnDisgusto(){
		super()
		nidos.add(new Nido())
	}
	
	override method relajar(){
		super()
		if(self.nidos().size() > 2){
			nidos.forEach({i=> i.cambiarGrosor(i.grosor()+1)})
		}
	}

	override method ira(){
		return super() + nidos.sum({i=> i.potencia()})
		
	}
}

class Nido{
	var property grosor = 5
	var property resistenciaMaterial = 3
	
	method cambiarGrosor(nuevoGrosor){
		self.grosor(nuevoGrosor)
	}
	
	method resistenciaMaterial(nuevaResistencia){
		self.resistenciaMaterial(nuevaResistencia)
	}

	method potencia(){
		return (self.grosor() * self.resistenciaMaterial()) + 20
	}
}