public class BadPracticeExample {
    // Violation: Public variable should be private
    public String myPublicVar = 'test';
    
    // Violation: Public variable should be private
    public String var1 = 'another test';
    
    // Violation: Empty catch block
    public void riskyMethod() {
        try {
            List<Account> accts = [SELECT Id FROM Account];
        } catch(Exception e) {
            // Empty catch block
        }
    }
    
    // Violation: SOQL inside loop
    public void queryInLoop() {
        List<Contact> contacts = [SELECT Id, AccountId FROM Contact LIMIT 10];
        for(Contact c : contacts) {
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :c.AccountId];
        }
    }
    
    // Violation: Hardcoded ID
    public void hardcodedId() {
        Account acc = [SELECT Id FROM Account WHERE Id = '001D000000I8mUOIAZ'];
    }
    
    // Violation: Method too long and complex
    public void complexMethod() {
        Integer count = 0;
        String temp = '';
        for(Integer i = 0; i < 100; i++) {
            if(i > 50) {
                if(math.mod(i, 2) == 0) {
                    if(i < 75) {
                        count++;
                        temp += String.valueOf(i);
                        if(count > 25) {
                            break;
                        }
                    }
                }
            }
        }
    }
}