global class PokemonBatch implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {
    public List<Pokemon__c> pokeList = new List<Pokemon__c>();
    public String query = 'Select ID,FirstName, LastName, Email, Name from Contact LIMIT 9';
    public Integer pokemonId = 1;
    global Database.QueryLocator start(Database.BatchableContext BC) {
        System.debug('pokemon Id' + pokemonId);
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Contact> records) {   
        String endpoint;
        System.debug('pokemon Id' + pokemonId);
        for (integer i = 1; i <= records.size(); i++ ) {
            for(Integer j = 1; j <= 50 && pokemonId <= 900; j++) {
              try {
                HttpRequest req = new HttpRequest();
                HttpResponse res = new HttpResponse();
                Http http = new Http();
                endpoint = 'https://pokeapi.co/api/v2/pokemon/' + pokemonId;
                req.setEndpoint(endpoint);
                req.setMethod('GET');
                res = http.send(req);
                String Response = res.getBody();
                  
                Pokemon pokemonServer = (Pokemon)JSON.deserialize(res.getBody(), Pokemon.class);
                
                Pokemon__c pokemonObject = new Pokemon__c();
                //PokemonSettings.searchPokemonType(pokemonServer.id);
                
                
                pokeList.add(new Pokemon__c(
                    	Name = pokemonServer.name.Capitalize(),
                      	Index__c = pokemonServer.id,
          				Altura__c = String.valueOf(pokemonServer.height) + 'm',
                  		FotoURL__c = pokemonServer.sprites.front_default,
                    	Peso__c = String.valueOf(pokemonServer.weight) + 'kg'));
                                                 
              }
              catch (Exception e) {       
                System.debug('Error is :' + e.getMessage() + 'LN:' + e.getLineNumber());         
              }
              pokemonId++;
            }
            insert pokeList;
        }
    } 
    global void finish(Database.BatchableContext BC){ }
}