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


    public static Movimiento__c devolverMovimiento(Movimientos m){

        Movimiento__c mov = new Movimiento__c();

         
        return mov;
    }

}
