#import "FDSmartOpen.h"

@implementation FDSmartOpen

NSString* iosScheme;
NSString* iosAppStore;
NSString* message;
NSString* okButton;
NSString* cancelButton;

- (void)open:(CDVInvokedUrlCommand*)command {

        iosScheme = [command.arguments objectAtIndex:1];
        iosAppStore = [command.arguments objectAtIndex:2];
        message = [command.arguments objectAtIndex:3];
        okButton = [command.arguments objectAtIndex:4];
        cancelButton = [command.arguments objectAtIndex:5];


		//Let's check if the app is present (e.g. if we can open the given urlscheme)
   		if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:iosScheme]]) {
   			//Yes ! then let's start it
        	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:iosScheme]];
    	}else{
    		//No.. then let's display a popup
        	UIAlertView* toMarket = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:cancelButton otherButtonTitles:okButton, nil];
        	[toMarket show];
    	}
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	//If the user clicked yes, let's go to the app store
    if (buttonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iosAppStore]];
    }
}

@end
