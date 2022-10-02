public with sharing class PokeHttp {
    public static Pokemon__c traerPokemon(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/'+id);
        request.setMethod('GET');
        request.setTimeout(2000);
        HttpResponse response = http.send(request);
		Poke pk = new Poke();
        
        if(response.getStatusCode() == 200) {
            String result = String.valueOf(response.getBody());
            pk=Poke.parse(result);
        	return devolverPokemon(pk);
        }
        else{ 
            system.debug('el status de la llamada fue'+response.getStatusCode());
            return null;
        }

        
    }

    public static Pokemon__c devolverPokemon(Poke pok){
       Pokemon__c pk1 = new Pokemon__c();
        pk1.ExtId__c = pok.id;
             pk1.Name = pok.name;
             pk1.Altura__c = pok.height;
             pk1.Numero_de_Pokemon__c = pok.order;
             pk1.Imagen__c = pok.sprites.front_default;   
             pk1.Peso__c = pok.weight; 
            
             for (Integer i = 0; i <= 4; i++) {
                 try {
                     if(i == 0){
                         pk1.Tipos__c = pok.types.get(i).type.name;
                     }else{
                         pk1.Tipos__c = pk1.Tipos__c + ';'+pok.types.get(i).type.name;
                     }
                 } catch (Exception e) {
                     break;
                 }               
             } 
             
           //CREO VARIABLE PARA HABILIDADES ALEATORIAS
           Integer aleatorioHabilidad  = Integer.valueof((Math.random() * pok.abilities.Size()));
         	String habilidad = pok.abilities.get(aleatorioHabilidad).ability.name;  
             try{
                 	pk1.Habilidad__c = [select Id from Habilidad__c where Name=:habilidad LIMIT 1].Id;
             }catch(System.QueryException e){
                 system.debug(e);
             }
          //CREO metodo try catch para que no largue error, el error que salia es que en el campo velocidad estaba fuera de los limites List index out of bounds: 5
        
        if(pok.stats.get(0).base_stat != Null){
             pk1.Vida__c = String.valueOf(pok.stats.get(0).base_stat);
        }
        
        if(pok.stats.get(1).base_stat != Null){
        	 pk1.Ataque__c = String.valueOf(pok.stats.get(1).base_stat);
 
        }
        
        if(pok.stats.get(2).base_stat != Null){
             pk1.Defensa__c = String.valueOf(pok.stats.get(2).base_stat);
        }
        
        if(pok.stats.get(5).base_stat!= Null){
            pk1.Velocidad__c = String.valueOf(pok.stats.get(5).base_stat);
        }
                    
     
            //CREO VARIABLE PARA MOVIMIENTOS ALEATORIAS
            try{
            Integer aleatorio = Integer.valueof((Math.random() * pok.moves.Size()));
            String movimiento = pok.moves.get(aleatorio).move.name;  
            pk1.Slot1__c = [select Id from Movimiento__c where Name=:movimiento LIMIT 1].Id;
            aleatorio = Integer.valueof((Math.random() * pok.moves.Size()));
            movimiento = pok.moves.get(aleatorio).move.name;  
            pk1.Slot2__c = [select Id from Movimiento__c where Name=:movimiento].Id;
            
            aleatorio = Integer.valueof((Math.random() * pok.moves.Size()));
            movimiento = pok.moves.get(aleatorio).move.name;  
            pk1.Slot3__c = [select Id from Movimiento__c where Name=:movimiento].Id;
            
            aleatorio = Integer.valueof((Math.random() * pok.moves.Size()));
            movimiento = pok.moves.get(aleatorio).move.name;  
            pk1.Slot4__c = [select Id from Movimiento__c where Name=:movimiento].Id;
             
        }catch(System.NullPointerException e){
                 System.debug(e);
             }
       
 	           
             System.debug('Tu pokemon es: '+pk1);      
             return pk1;  
         }
}