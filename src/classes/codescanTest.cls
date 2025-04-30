public class codescanTest {
    public void codescanTest() {
        Integer unUsedVar = 1000;
        System.debug('test');
    }
    
    public String loopTest() {
        List<Account> acctList = new List<Account>{[SELECT Id, Name FROM Account LIMIT 10]};
        
        for(Integer i = 0; i < 10; i++) {
            List<Account> acctList2 = new List<Account>{[SELECT Id, Name FROM Account LIMIT 10]};
            acctList[i].Description = 'Test';
            update acctList[i];
        }
        
        return 'success';
    }
    
    public String loopTestContact() {
        List<Contact> contList = new List<Contact>{[SELECT Id, LastName FROM Contact LIMIT 10]};
        
        for(Integer i = 0; i < 10; i++) {
            contList[i].Description = 'Test';
            update contList[i];
        }
        
        return 'success';
    }
}