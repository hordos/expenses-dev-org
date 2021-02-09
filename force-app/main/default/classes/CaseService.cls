global with sharing class CaseService {
    /*global class CloseCasesInfo {
        global Id caseId;
        global String reason;
    }*/
    
    /*global static void closeCases(List<CloseCasesInfo> closeCasesInfo) {
        List<Case> casesToUpdate = new List<Case>();
        
        List<Id> caseLst = new List<Id>();
        for(CloseCasesInfo caseInfo : closeCasesInfo) {
            caseLst.add(caseInfo.caseId);
        }
        
        Map<Id, Case> casesMap = new Map<Id, Case>(
            [SELECT Id, Status, Reason 
             FROM Case 
             WHERE Id IN :caseLst]);
        for(CloseCasesInfo caseInfo : closeCasesInfo) {
            Case caseToClose = casesMap.get(caseInfo.caseId);
            caseToClose.Status = 'Closed';
            caseToClose.Reason = caseInfo.reason;
            casesToUpdate.add(caseToClose);
        }
        
        Database.update(casesToUpdate, true);
    }*/
    
    global static void closeCases(Set<Id> caseIds, String reason) {
        List<Case> casesToClose = [SELECT Id, Status, Reason FROM Case WHERE Id = :caseIds];
        
        for(Case c : casesToClose) {
            c.Status = 'Closed';
            c.Reason = reason;
        }
        
        update casesToClose;
    }
        
}