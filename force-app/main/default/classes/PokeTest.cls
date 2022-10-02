@isTest

public with sharing class PokeTest {
    @isTest
    public static void PokeTest() {
        
        String pok = '{"height":8,"id":135,"name":"Test","order":218,"sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/135.png"},"types":[{"type":{"name":"electric"}},{"type":{"name":"fire"}}],"weight":245}';
        
        Poke x = new Poke();
        x=Poke.parse(pok);
        
        System.assertEquals(x.height,8);  
    }
}
