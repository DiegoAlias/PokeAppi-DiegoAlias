public with sharing class HabilidadHttp {
    public static Habilidad__c traerHabilidad(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/ability/'+id);
        request.setMethod('GET');
        request.setTimeout(2000);
        HttpResponse response = http.send(request);
		Habilidades pk = new Habilidades();
        
        if(response.getStatusCode() == 200) {
            String result = String.valueOf(response.getBody());
            pk=Habilidades.parse(result);
        	return devolverHabilidad(pk);
        }
        else{ 
            system.debug('el status de la llamada fue'+response.getStatusCode());
            return null;
        }
    }

    public static Habilidad__c devolverHabilidad(Habilidades h){

        Habilidad__c hab = new Habilidad__c();
		
        hab.Name = h.name;
        hab.ExtId__c = h.id;
        hab.Efecto__c = h.effect_entries.isEmpty() ? 'None' : (h.id < 191)
                 											? h.effect_entries[1].short_effect : h.effect_entries[0].short_effect;
        
       
        return hab;
    }
}