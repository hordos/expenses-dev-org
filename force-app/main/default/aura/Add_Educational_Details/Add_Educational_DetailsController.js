({
	
    doInit: function(component, event, helper) {
        console.log("This text is from init method defined in Child Component");
        helper.rectifySequenceHelper(component, event);
    },
	
    
    deleteDetails : function(component, event, helper) {
        var NewEducationDetailsList = component.get("v.EducationalDetailListInnerComponent");
        var currentIndex = component.get("v.indexNo");
        /*if(currentIndex > -1)*/
	    NewEducationDetailsList.splice(currentIndex, 1);
        component.set("v.EducationalDetailListInnerComponent", NewEducationDetailsList);
	},
    
    
    changeInIndexNo: function(component, event, helper) {
        console.log("There is a change noticed in indexNo attribute");
        helper.rectifySequenceHelper(component, event);
    },
    
})