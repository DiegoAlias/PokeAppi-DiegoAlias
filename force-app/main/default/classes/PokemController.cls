public with sharing class PokemController {
  
  @AuraEnabled(Cacheable=true)
  public static Pokemon__c[] searchPokemons(String searchTerm,String tipo,Integer generacion) {
        
      searchTerm = searchTerm.trim();
      searchTerm = '%' + searchTerm + '%';

      String query = 'SELECT Id, Name, Generacion__c, Tipos__c, Altura__c, Peso__c,  Imagen__c, ExtId__c  FROM Pokemon__c';
      
          if (searchTerm != '') {
          query += ' WHERE Name LIKE :searchTerm ';
          }
          if (tipo != 'Todos') {
            query += ' AND Tipos__c INCLUDES(:tipo) ';
          }
          if (generacion != 0) {
            query += ' AND Generacion__c =:generacion ';
          }
          // query += ' ORDER BY ExtId__c';
      return Database.query(query);

      //return [SELECT Name FROM Pokemon__c];
      
  }
}