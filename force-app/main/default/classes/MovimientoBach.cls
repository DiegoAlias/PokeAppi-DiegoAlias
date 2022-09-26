public class MovimientoBach implements Database.Batchable<sObject>,Database.AllowsCallouts,Database.Stateful{
    List<Movimiento__c> Movimiento_List;
    
    public MovimientoBach(List<Movimiento__c> Movimiento_List) {
        this.Movimiento_List=Movimiento_List;
    }
    public Iterable<sObject> start(Database.BatchableContext bc) {
        return this.Movimiento_List;
    }

    public void execute(Database.BatchableContext bc, List<Movimiento__c> records){
        
        integer var=integer.valueOf(records[0].ExtId__c);
        Movimiento__c movimiento = MovesHttp.traerMovimiento(var);
        if(movimiento!=null){
            insert movimiento;
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Batch terminado');
    }
}