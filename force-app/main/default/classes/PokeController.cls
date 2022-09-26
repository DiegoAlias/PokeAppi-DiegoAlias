public with sharing class PokeController {
    @AuraEnabled(Cacheable=true)
        public static Pokemon__c[] getAllPokemons() {
            return [
              SELECT
                Id,
                Name,
                Altura__c,
                Peso__c,
                Generacion__c,
                Tipos__c,
                Imagen__c,
                ExtId__c
              FROM Pokemon__c
              WITH SECURITY_ENFORCED
              ORDER BY ExtId__c
              LIMIT 899
            ];
        }

    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] searchPokemons(String searchTerm,String tipo,Integer generacion) {
          
        searchTerm = searchTerm.trim();
        searchTerm = '%' + searchTerm + '%';

        String query = 'SELECT Id, Name, Altura__c, Peso__c, Generacion__c, Tipos__c, Imagen__c, ExtId__c FROM Pokemon__c';
        
            if (searchTerm != '') {
              query += ' WHERE Name LIKE :searchTerm ';
            }
            if (tipo != 'Todos') {
              query += ' AND Tipos__c INCLUDES(:tipo) ';
            }
            if (generacion != 0) {
              query += ' AND Generacion__c =:generacion ';
            }
            query += ' ORDER BY ExtId__c';
        return Database.query(query);
    }
}
