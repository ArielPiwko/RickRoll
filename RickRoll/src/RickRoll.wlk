class Persona{
	var nivelCordura
	var parasitos = []
	constructor(cordura){
		nivelCordura = cordura
	}
	
	method cordura() = nivelCordura
	method parasitos() = parasitos
	
	method infectarse(parasito){
		nivelCordura -= parasito.efecto()
		parasitos.add(parasito)
	}
	
	method entrarEnContactoCon(persona){
		parasitos.forEach({parasito => persona.infectarse(parasito)})
		parasitos.forEach({parasito => persona.aptaParaReproducirse(parasito)})
		}
				
	method aptaParaReproducirse(parasito){
		if (nivelCordura > parasito.lastima()){
			var nuevoParasito = parasito.reproducirse()
			self.infectarse(nuevoParasito)
			}
	}
}

class Parasito{
	var nivelLastima
	var cuantoAfecta
	constructor(lastima,poder){
		nivelLastima = lastima
		cuantoAfecta = poder
	}	
	
	method reproducirse() = new Parasito(10.max(nivelLastima/4),1.max(cuantoAfecta/2))	
	method efecto() = cuantoAfecta
	method lastima() = nivelLastima
}