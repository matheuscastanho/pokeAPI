public with sharing class PokemonClass {
    @AuraEnabled
    public static List<Pokemon__c> getPokemons(String searchKey){
        
        if(searchKey !=''){
            String key = '%'+searchKey+'%';
            
            List<Pokemon__c> pokemonSearchList = [SELECT Id, Index__c, Name, FotoURL__c, Altura__c, Peso__c FROM Pokemon__c WHERE name LIKE:key];
            Return pokemonSearchList;
        }
        
        else{
            List<Pokemon__c> pokemonList = [SELECT Id, Index__c, Name, FotoURL__c, Altura__c, Peso__c FROM Pokemon__c];
        		if(!pokemonList.isEmpty()){
            	return pokemonList;
        		}
        return NULL;
        }
    }
}