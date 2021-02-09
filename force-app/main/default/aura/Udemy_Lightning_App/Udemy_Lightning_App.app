<aura:application extends="force:slds">
	
    <aura:attribute name="OpenRegistrationForm" type="Boolean" default="false"/>
    <aura:attribute name="ButtonLabel" type="String" default="Open Registration Form"/>
    
    <!--<lightning:button label="{!v.ButtonLabel}" onclick="{!c.openOrCloseRegistrationForm}"/>-->
    
    <c:Registration_Component/>
    <!--<aura:if isTrue="{!v.OpenRegistrationForm}">
        
    </aura:if>-->

   
</aura:application>