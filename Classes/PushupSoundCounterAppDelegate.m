//
//  PushupSoundCounterAppDelegate.m
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import "PushupSoundCounterAppDelegate.h"
#import "PushupSoundCounterViewController.h"

@implementation PushupSoundCounterAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
