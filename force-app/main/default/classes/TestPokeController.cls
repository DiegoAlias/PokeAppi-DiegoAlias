@isTest
public with sharing class TestPokeController {
    @isTest
    public static void TestPokeController() {
        test.startTest();
		  delete [Select fields(standard) from Pokemon__c ];
          insert New Pokemon__c(ExtId__c = 1);
        test.stopTest();        
        
        List<Pokemon__c> y=[select Name,ExtId__c, Imagen__c, Tipos__c, Generacion__c, Altura__c, Peso__c  
        from Pokemon__c 
        WHERE ExtId__c=1 and Generacion__c=1 
        Limit 1];
 
        List<Pokemon__c> x= PokemController.searchPokemons('','Todos',0);
        
        System.assertEquals(x.get(0),y.get(0));
    }
}