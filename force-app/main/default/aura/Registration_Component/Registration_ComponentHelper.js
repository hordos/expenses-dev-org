({
	onClickCheckboxHelper: function(component, event) {
		// BODY of Helper - define logic here
        console.log("Text from HELPER function");
        
        var checkBoxValue = component.find("checkBox").get("v.checked");
        component.set("v.CheckboxValue", checkBoxValue);
        component.set("v.RegForm.Available_on_weekends__c", checkBoxValue);
	}
})