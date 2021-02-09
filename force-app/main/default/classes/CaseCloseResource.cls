@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    
    @HttpPost
    global static void closeCase(String reason) {
        RestRequest req = RestContext.request;
        String[] uriParts = req.requestURI.split('/');
        Id caseId = uriParts[2];
        
        //CaseService.CloseCasesInfo caseInfo = new CaseService.CloseCasesInfo();
        //caseInfo.reason = reason;
        //caseInfo.caseId = caseId;
        
        // Call the service
        //CaseService.closeCases(new List<CaseService.CloseCasesInfo> {caseInfo});
        CaseService.closeCases(new Set<Id> {caseId}, reason);
    }

}