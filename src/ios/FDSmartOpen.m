//
//  FDSmartOpen.m
//  iMaze Zen
//
//  Created by Hugo Garcia-Cotte on 18/8/14.
//  Copyright (c) 2014 MED entreprises. All rights reserved.
//

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


   		if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:iosScheme]]) {
        	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:iosScheme]];
    	}else{
        	UIAlertView* addCollection = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:cancelButton otherButtonTitles:okButton, nil];
        	[addCollection show];
    	}
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iosAppStore]];
    }
}

@end
