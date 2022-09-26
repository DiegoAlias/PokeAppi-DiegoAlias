public class PokeBatch implements Database.Batchable<sObject>,Database.AllowsCallouts,Database.Stateful{
    List<Pokemon__c> Pokemon_List;
    
    public PokeBatch(List<Pokemon__c> Pokemon_List) {
        this.Pokemon_List=Pokemon_List;
    }
    public Iterable<sObject> start(Database.BatchableContext bc) {
        return this.Pokemon_List;
    }

    public void execute(Database.BatchableContext bc, List<Pokemon__c> records){
        
        integer var2=integer.valueOf(records[0].ExtId__c);
        Pokemon__c pokemon = PokeHttp.traerPokemon(var2);
        if(pokemon!=null){
            insert pokemon;
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Batch terminado');
    }
}
