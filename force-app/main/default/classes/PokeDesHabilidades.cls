public with sharing class PokeDesHabilidades {
    public Integer id;
	public String name;
    public cls_effect_entries[] effect_entries;

	class cls_effect_entries {
		public String effect;	//This Pokémon's Speed rises one stage after each turn.
		public cls_language language;
		public String short_effect;	//Raises Speed one stage after each turn.
	}

    class cls_language {
		public String name;	//en
		public String url;	//https://pokeapi.co/api/v2/language/9/
	}

    public static PokeDesHabilidades parse(String json) {
        return (PokeDesHabilidades) System.JSON.deserialize(json, PokeDesHabilidades.class); 
    }
}
