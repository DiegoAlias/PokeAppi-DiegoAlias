public with sharing class MovesHttp {
    public static Movimiento__c traerMovimiento(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/move/'+id);
        request.setMethod('GET');
        request.setTimeout(2000);
        HttpResponse response = http.send(request);
		Movimientos pk = new Movimientos();
        
        if(response.getStatusCode() == 200) {
            String result = String.valueOf(response.getBody());
            pk=Movimientos.parse(result);
        	return devolverMovimiento(pk);
        }
        else{ 
            system.debug('el status de la llamada fue'+response.getStatusCode());
            return null;
        }
    }

    public static Movimiento__c devolverMovimiento(Movimientos mov){

        Movimiento__c move = new Movimiento__c();
             
            move.Name = mov.name == null ? 'No Name' : mov.name;
            
            move.ExtId__c = mov.id == null ? 0 : mov.id;
            
            move.Punteria__c = mov.accuracy == null ? 'None' : String.valueOf(mov.accuracy);             
            
            move.Chance_de_Efecto__c = mov.effect_chance == null ? 'None' : mov.effect_chance;
            
            move.Efecto__c = mov.effect_entries.isEmpty() ? 'No Effect' : mov.effect_entries[0].short_effect;
            
            move.Poder__c = mov.power == null ? 'None' : String.valueOf(mov.power);
            
            move.Pp__c = mov.pp == null ? 'None' : String.valueOf(mov.pp);
            
            move.Prioridad__c = mov.priority == null ? 'None' : String.valueOf(mov.priority);
            
            move.Tipo__c = mov.type.name == null ? 'None' : mov.type.name.capitalize();
			
            return move;
    }
}