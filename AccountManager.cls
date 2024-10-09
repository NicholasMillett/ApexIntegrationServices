@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        // Get the current REST request
        RestRequest request = RestContext.request;
        
        // Extract the Account ID from the URL
        String accountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/') - 18,
            request.requestURI.lastIndexOf('/')
        );

        // Query the Account and associated Contacts
        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                          FROM Account 
                          WHERE Id = :accountId];

        // Return the Account object
        return result;
    }
}
