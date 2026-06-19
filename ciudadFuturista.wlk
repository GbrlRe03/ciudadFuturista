
import misiones.*
object ciudadFuturista{
   var property cantMaxDrones= 10
   method cambiarCantDrones(unValor){
      cantMaxDrones = unValor
   }
}


class Drones {
 const property sensores=[]
 var property autonomia
 var nivelProcesamiento
 var mision
 method eficienciaOperativa(){
   return autonomia*10+ mision.extra()
 }

 method reprogramarDron(unaMision){
    mision = unaMision
 }

 method esAvanzado(){
   self.esTipoAvanzado() || mision.esAvanzado(self)
 }
 method esTipoAvanzado()

 method misionCumplida(){
   autonomia=autonomia-autonomia*0.05
 }

}

class Comercial inherits Drones{
   override method eficienciaOperativa() = super()*1.1
   override method esTipoAvanzado()= false 
} 

class Seguridad inherits Drones{
override method esTipoAvanzado(){
   return nivelProcesamiento>50
}
}
class Zona{
   var property tamañoTotal
   var property operacionesRecibidas
   method sumarOperacion(){
      operacionesRecibidas+=1
   }
}

class Escuadron{
   const drones=[]
   var capacidadOperativa
   method puedeOperar(unaZona){
     return drones.any({c=>c.esAvanzado()}) and capacidadOperativa>unaZona.tamañoTotal()*0.5
   }

   method agregarDron(unDron){
      if (drones.size()<ciudadFuturista.cantMaxDrones()){
         drones.add(unDron)
      }
      else self.error('Supera la cantidad máxima definida por la ciudad')
   }

   method operar(unaZona){
      if (self.puedeOperar(unaZona)){
         unaZona.sumarOperacion()
         drones.forEach({c=>c.misionCumplida()})
      }
      else{self.error('No se puede operar la zona')}
   }
}


