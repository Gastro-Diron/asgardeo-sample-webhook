import ballerinax/trigger.asgardeo;
import ballerina/log;
import ballerina/http;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:RegistrationService on webhookListener {

    remote function onAddUser(asgardeo:AddUserEvent event ) returns error? {
        
        log:printInfo(event.toJsonString());
        log:printInfo("User has been added");
    }
    
    remote function onConfirmSelfSignup(asgardeo:GenericEvent event ) returns error? {
        
        log:printInfo(event.toJsonString());
        log:printInfo("Self sign up confirmed");
    }
    
    remote function onAcceptUserInvite(asgardeo:GenericEvent event ) returns error? {
        
        log:printInfo(event.toJsonString());
        log:printInfo("User Invite accepted");
    }
}

service /ignore on httpListener {}