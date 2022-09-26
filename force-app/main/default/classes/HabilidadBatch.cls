public class HabilidadBatch implements Database.Batchable<sObject>,Database.AllowsCallouts,Database.Stateful{
    List<Habilidad__c> Habildiad_List;

    public HabilidadBatch(List<Habilidad__c> Habildiad_List) {
        this.Habildiad_List=Habildiad_List;
    }
    public Iterable<sObject> start(Database.BatchableContext bc) {
        return this.Habildiad_List;
    }

    public void execute(Database.BatchableContext bc, List<Habilidad__c> records){
        
        integer var1=integer.valueOf(records[0].ExtId__c);
        Habilidad__c habilidad = HabilidadHttp.traerHabilidad(var1);
        if(habilidad!=null){
            insert habilidad;
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Batch terminado');
    }
}
