@isTest
public with sharing class TestPokeBatch {
    @isTest
    public static void TestPokeBatch() {
        List<Pokemon__c> PokeList= new List<Pokemon__c>();
    	for(integer i=1;i<150;i++){
            Pokemon__c x = new Pokemon__c();
            x.ExtId__c=i;
            PokeList.add(x);
    	}
        
        if(!PokeList.isEmpty())
            insert PokeList;
        
        String var = '{"height":8,"id":135,"name":"Test","order":218,"sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/135.png"},"types":[{"type":{"name":"electric"}},{"type":{"name":"fire"}}],"weight":245}';
        test.setMock(HttpCalloutMock.class, new PokeMock(var,200));
        
        PokeBatch bacth = new PokeBatch(PokeList);

        Test.startTest();
        	Database.executeBatch(bacth,150);
        Test.stopTest();
		
        List<Pokemon__c> x= [select Name from Pokemon__c where Name='Test'];
		system.assertEquals(x.get(0).Name, 'Test');  
    }
}