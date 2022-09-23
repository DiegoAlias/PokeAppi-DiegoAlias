public with sharing class Habilidades {
    public Integer id;
    public cls_effect_entries[] effect_entries;

	public class cls_effect_entries {
		public String effect;	//This Pokémon's Speed rises one stage after each turn.
		public cls_language language;
		public String short_effect;	//Raises Speed one stage after each turn.
	}

    public class cls_language {
		public String name;	//en
		public String url;	//https://pokeapi.co/api/v2/language/9/
	}

    public static Habilidades parse(String json){
		return (Habilidades) System.JSON.deserialize(json, Habilidades.class);
	}
}