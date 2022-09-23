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

    public static Pokemon__c devolverPokemon(Poke Pk){
        Pokemon__c poke = new Pokemon__c();
        poke.Name = Pk.name;
        poke.ExtId__c = Pk.id;
        poke.Altura__c = Pk.height;
        poke.Peso__c = Pk.weight;
        poke.Imagen__c = Pk.sprites.front_default;
        poke.Vida__c = String.valueOf(Pk.stats.get(0).base_stat);
        poke.Ataque__c = String.valueOf(Pk.stats.get(1).base_stat);
        poke.Defensa__c = String.valueOf(Pk.stats.get(2).base_stat);
        poke.Velocidad__c = String.valueOf(Pk.stats.get(5).base_stat);
        
      	for (Integer i=0; i <= Pk.types.Size(); i++){
            if (i == 0){
                poke.Tipos__c = Pk.types.get(0).type.name;
            }
            else{
                poke.Tipos__c = poke.Tipos__c + ';' + Pk.types.get(i).type.name;
            }
        }
        
        Integer aleatorio = Integer.valueof((Math.random() * Pk.moves.Size()));
        String x = Pk.moves.get(aleatorio).move.name;
        poke.Slot1__c = [SELECT Id FROM Movimiento__c WHERE Name = :x ].Id;
        
        aleatorio = Integer.valueof((Math.random() * Pk.moves.Size()));
        x = Pk.moves.get(aleatorio).move.name;
        poke.Slot2__c = [SELECT Id FROM Movimiento__c WHERE Name = :x ].Id;
        
        aleatorio = Integer.valueof((Math.random() * Pk.moves.Size()));
        x = Pk.moves.get(aleatorio).move.name;
        poke.Slot3__c = [SELECT Id FROM Movimiento__c WHERE Name = :x ].Id;
        
        aleatorio = Integer.valueof((Math.random() * Pk.moves.Size()));
        x = Pk.moves.get(aleatorio).move.name;
        poke.Slot4__c = [SELECT Id FROM Movimiento__c WHERE Name = :x ].Id;
        
        aleatorio = Integer.valueof((Math.random() * Pk.abilities.Size()));
        x = Pk.abilities.get(aleatorio).ability.name;
        poke.Habilidad__c = [SELECT Id FROM Habilidad__c WHERE Name = :x ].Id;
        
        return poke;
    }
}