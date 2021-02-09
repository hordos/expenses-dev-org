@isTest
public class UnitOfWorkTest {
    
    @isTest static void challengeComplete() {
        
        // Create the Unit of Work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );

        // Creating the 100 account records
        for(Integer i = 0; i < 100; i++) {
            Account a = new Account( Name = 'Test Account ' + i);
            uow.registerNew(a);

            // Creating the 500 records of contact and note records
            for(Integer j = 0; j < 5; j++) {
                Contact c = new Contact( LastName = 'Test Contact ' + i);
                uow.registerRelationship(c, Contact.AccountId, a);
                uow.registerNew(c, Contact.AccountId, a);

                Note n = new Note( Body = 'Test Note ' + i, Title = 'Test Note ' + i);
                uow.registerRelationship(n, Note.ParentId, c);
                uow.registerNew(n, Note.ParentId, c);
            }
        }
        

        test.startTest();
        
        // Commit the work to the database!
        uow.commitWork();
        
        test.stopTest();
        
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());    
    }
        
}