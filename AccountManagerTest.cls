@isTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Contact testContact1 = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount.Id);
        Contact testContact2 = new Contact(FirstName = 'Jane', LastName = 'Doe', AccountId = testAccount.Id);
        insert new List<Contact> { testContact1, testContact2 };

        // Set up a test REST request
        RestRequest request = new RestRequest();
        request.requestUri = '/services/apexrest/Accounts/' + testAccount.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        // Call the method to test
        Account result = AccountManager.getAccount();

        // Verify results
        System.assertNotEquals(null, result, 'Account should not be null');
        System.assertEquals('Test Account', result.Name, 'Account name should match');
        System.assertEquals(2, result.Contacts.size(), 'There should be 2 contacts');
    }
}