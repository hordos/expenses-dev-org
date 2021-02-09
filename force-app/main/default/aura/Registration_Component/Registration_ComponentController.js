({
    doInit: function(component, event, helper) {
        
        var action = component.get("c.getHoursOfStudy");
        
        action.setCallback (this, function(response) {
            
             var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.HoursOfStudy", response.getReturnValue() );            
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error...");
                }
                
                
            }
        });
        $A.enqueueAction(action);
    },
	doSubmit : function(component, event, helper) {
    	// call apex function saveRegistrationDetails(Registration_Form__c regForm) to save data in reg form
    	// pass RegForm as a param
    	console.log("<<<<<ENTERS DOSUBMIT>>>>>");
        
    	var RegForm = component.get("v.RegForm");
        console.log("<<RegForm>>" + RegForm);
        
        // Create a one-time use instance of the Udemy1_SaveRegistrationForm.saveRegistrationDetails() action
        // in the server-side controller
        var action = component.get("c.saveRegistrationDetails");	// c.NAME_OF_APEX_FUNCTION, it is not an expression
        action.setParams({ regForm : RegForm });
        
        console.log("<<Action>>" + action);
        
        
        // Create a callback that is executed after the server-side action returns
        action.setCallback (this, function(response) {
            
            
            var state = response.getState();
            if (state === "SUCCESS") {
                // ALERT the user with the value returned from the server
                alert("From server: " + response.getReturnValue() ); // the id of the new record
                helper.clearForm(component);
                // add more logic
                // save/store educational details
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error...");
                }
                
                
            }
            
        } );
        // $A.enqueueAction adds the server-side action to the queue
                $A.enqueueAction(action);
        
	},
    
    onclickCheckbox : function (component, event, helper) {
    	// BODY of the function
        console.log("Text from CONTROLLER function");
    	helper.onClickCheckboxHelper(component, event);			// call the function defined in helper
	},
    
    addDetails: function(component, event, helper) {
        
        console.log("Add Educational Details");
        var CurrentEducationDetailList = component.get("v.EducationalDetailList");
        var currentSize = parseInt( (CurrentEducationDetailList.length) );
        component.log(currentSize);
        var newSize = parseInt( (currentSize.length) + 1 );
        component.log(newSize);
        CurrentEducationDetailList.push(newSize);
        component.set("v.EducationalDetailList",CurrentEducationDetailList);
        component.log("added");
    },
    
})