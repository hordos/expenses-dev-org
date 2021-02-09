({
	// Your renderer method overrides go here
    render: function(component, helper) {
        // call base render method
        var a = this.superRender();
        // custom rendering
        console.log("Text from render function which gets executed when component is initiated");
        return a;
    },
    
    
    afterRender: function(component, helper) {
        // call base afterRender method
        this.superAfterRender();
        // interact with DOM elements
        console.log("This text should come after render() is over");
        console.log("This text is from afterRender function");
    },
    
    
    rerender: function(component, helper) {
        // call base reRender method
        this.superRerender();
        // custom rerendering
        console.log("This text is from rerender function... which gets called whenever a data change occurs");
    },
    
    
    unrender: function(component, helper) {
        // call base unrender method
        this.superUnrender();
        // custom unrendering
        console.log("This text appears when Registration component is destroyed");
    }
    
})