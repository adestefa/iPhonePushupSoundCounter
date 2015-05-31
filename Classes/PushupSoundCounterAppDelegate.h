//
//  PushupSoundCounterAppDelegate.h
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PushupSoundCounterViewController;

@interface PushupSoundCounterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PushupSoundCounterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PushupSoundCounterViewController *viewController;

@end

