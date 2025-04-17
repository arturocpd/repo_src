trigger VulnerableTrigger on Account (before insert, before update) {

    for (Account acc : Trigger.new) {

        // SOQL inside loop (inefficient and risky)
        List<Contact> contacts = [SELECT Id, Email FROM Contact WHERE AccountId = :acc.Id];

        // Hardcoded ID (bad practice)
        if (acc.OwnerId == '005xx000001Sv6bAAC') {
            acc.Description = 'Owned by a specific user';
        }

        // Dynamic SOQL with user input (possible injection)
        String userInput = acc.Name;
        String query = 'SELECT Id FROM Account WHERE Name = \'' + userInput + '\'';
        List<Account> matchedAccounts = Database.query(query);

        // DML inside loop (inefficient)
        Contact newContact = new Contact(LastName = 'Dummy', AccountId = acc.Id, Email = 'test@example.com');
        insert newContact;

        // No FLS checks for Description field
        acc.Description = 'Updated without FLS check';
    }
}
