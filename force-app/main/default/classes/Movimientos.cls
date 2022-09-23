public with sharing class Movimientos {
    public Integer id;
    public String name;
    public Integer accuracy;
    public String effect_chance;
    public Integer power;
    public Integer pp;
    public Integer priority;
    public cls_target target;
	public cls_type type;
    public cls_effect_entries[] effect_entries;
	
    public class cls_effect_entries {
		public String effect;	//Inflicts Pokemon_DMovimientos[regular damage]{mechanic:regular-damage}.
		public String short_effect;	//Inflicts regular damage with no additional effect.
		
	}

    public class cls_type{
        public cls_type[] type;
        public String name;
    }
    
    public class cls_target{
        public cls_target[] target;
        public String name;//selected-pokemon
    } 
    public static Movimientos parse(String json){
		return (Movimientos) System.JSON.deserialize(json, Movimientos.class);
	}
}