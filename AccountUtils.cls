public with sharing class AccountUtils {
    // Static method to return accounts by state
    public static List<Account> accountsByState(String stateAbbreviation) {
        // Query Account records where BillingState matches the provided abbreviation
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE BillingState = :stateAbbreviation];
        
        // Return the list of matching accounts
        return accounts;
    }
}
