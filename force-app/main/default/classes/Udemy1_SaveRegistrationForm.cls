public class Udemy1_SaveRegistrationForm {
    
    /*
     * 
     * 						Since the  function is used by lightning components
     * 						it must have the annotation @AuraEnabled
     */
    @AuraEnabled
    public static Id saveRegistrationDetails(Registration_Form__c regForm) {
        System.debug('regForm++++'+ regForm);
        // DML operation to save RegForm
        insert regForm;
        return regForm.Id;
    }
    
     
    // Class picklist wrapper
    class PicklistValueWrapper {
        @AuraEnabled
        public String value { public get; private set; }
        
        @AuraEnabled
        public String label { public get; private set; }
        
        PicklistValueWrapper(String v, String l) {
            this.value = v;
            this.label = l;
        }
    }
    
    
    @AuraEnabled
    public static List<PicklistValueWrapper> getHoursOfStudy() {
        
        List<PicklistValueWrapper> hoursOfStudy = new List<PicklistValueWrapper>();
        hoursOfStudy.add(new PicklistValueWrapper(null, '--None--'));
        for (PicklistEntry pe : Registration_Form__c.Study_Hours__c.getDescribe().getPicklistValues()) {
            hoursOfStudy.add(new PicklistValueWrapper(pe.value, pe.label));
        }

        return hoursOfStudy;
    }

}