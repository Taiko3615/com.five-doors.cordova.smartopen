//
//  FDSmartOpen.m
//  iMaze Zen
//
//  Created by Hugo Garcia-Cotte on 18/8/14.
//  Copyright (c) 2014 MED entreprises. All rights reserved.
//

#import "FDSmartOpen.h"

@implementation FDSmartOpen



- (void)homeManagerAction:(CDVInvokedUrlCommand*)command {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"imazefitness://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"imazefitness://"]];
    }else{
        UIAlertView* addCollection = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"If you don't have to download iMaze Fitness confirm download", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"no", nil) otherButtonTitles:NSLocalizedString(@"yes", nil), nil];
        [addCollection show];
    }
    
}

@end
