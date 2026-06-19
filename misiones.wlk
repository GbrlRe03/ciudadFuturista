import ciudadFuturista.*

class Mision{
    method extra(unDron)
    method esAvanzado(unDron)

}
class Transporte inherits Mision{
    override method extra(unDron){
       return 100
    }

    override method esAvanzado(unDron){
        return unDron.autonomia()>50
    }
}

class Exploracion inherits Mision{
    override method extra(unDron)= 0

    override method esAvanzado(unDron){
        return unDron.eficienciaOperativa().even()
    }
}

class Vigilancia inherits Mision{
    
    override method extra(unDron){
        unDron.sensores().sum({sensor=>sensor.eficiencia()})
    }

    override method esAvanzado(unDron){
        return unDron.sensores().all({sensor=>sensor.esDuradero()})
    }
}

class Sensor{
    const capacidad
    const durabilidad
    const tieneMejoras 
    method eficiencia(){
        if (!self.tieneMejoras()){
            return capacidad
        }
        else {
            return capacidad*2
        }
    }

    method esDuradero(){
        return durabilidad>capacidad*2
    }
    
}
