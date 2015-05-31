//
//  first.m
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import "first.h"
#import "PushupSoundCounterViewController.h"
#import <AudioToolbox/AudioServices.h>


@implementation first


/** sounds */
@synthesize sound_pushup_Ref;
@synthesize sound_pushup_Object;

@synthesize sound_applause_Ref;
@synthesize sound_applause_Object;

@synthesize sound_achievement_Ref;
@synthesize sound_achievement_Object;

/** Counter label */
@synthesize statusText;


/** number of pushups */
int pushups = 0;


- (void)viewDidLoad {
	

	
	/** load sound files */
	
	CFBundleRef mainBundle;
	mainBundle = CFBundleGetMainBundle();
	
		
	/** pushup sound */
	sound_pushup_Ref  =    CFBundleCopyResourceURL (
													 mainBundle,
													 CFSTR ("space1"),
													 CFSTR ("aiff"),
													 NULL
													 );
	AudioServicesCreateSystemSoundID (sound_pushup_Ref, &sound_pushup_Object);
	
	/** applause sound */
	sound_applause_Ref  =    CFBundleCopyResourceURL (
													  mainBundle,
													  CFSTR ("drums"),
													  CFSTR ("aiff"),
													  NULL
													  );
	AudioServicesCreateSystemSoundID (sound_applause_Ref, &sound_applause_Object);
	
	
	
	
	/** achievement sound */
	sound_achievement_Ref  =    CFBundleCopyResourceURL (
													mainBundle,
													CFSTR ("applause"),
													CFSTR ("aiff"),
													NULL
													);
	AudioServicesCreateSystemSoundID (sound_achievement_Ref, &sound_achievement_Object);
	
	
  	
	/** setup proxomity device */
	UIDevice *device = [UIDevice currentDevice];
	device.proximityMonitoringEnabled = YES;
	if (device.proximityMonitoringEnabled == YES){
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:@"UIDeviceProximityStateDidChangeNotification" object:device];
	}
	
	
	/** setup status label */
	NSString *str = [[NSString alloc] initWithFormat:@"%d",pushups];
	[statusText setText:str];
	[str release];

	[super viewDidLoad];

}



/** record pushup */
- (void) proximityChanged:(NSNotification *)notification {
	
	
	UIDevice *device = [notification object];
		
	/** Proximity changed filter on state only */
	if(device.proximityState == 1){
		
		/** Update pushup count */
		pushups++;
		
		/** play pushup sound */
		[self playSoundPushup:self];
			
		/** special sound every 10 */
		if(pushups == 10 || pushups == 20 || pushups == 30 || pushups == 40 || pushups == 60
		    || pushups == 70 || pushups == 80 || pushups == 90){
			[self playSoundApplause:self];	
		}
		
		/** applause when reach 50 or 100 */
		if(pushups == 50 || pushups == 100) {
			[self playSoundAchievement:self];
		
		}
		
		/** Update count on screen */
		NSString *newText = [[NSString alloc] initWithFormat:@"%d", pushups];
		[statusText setText:newText];
		[newText release];
		
	}	
	
}




// back to home screen
- (IBAction) goToHome{
	PushupSoundCounterViewController *home = [[PushupSoundCounterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:home animated:YES];
	[home release];
}



- (IBAction) resetCount{
	pushups = 0;
	NSString *newText = [[NSString alloc] initWithFormat:@"%d", pushups];
	[statusText setText:newText];
	[newText release];
		
}


/** play Pushup sound */
- (IBAction)playSoundPushup:(id)sender {
	AudioServicesPlaySystemSound (self.sound_pushup_Object);
}


/** play Applause sound */
- (IBAction)playSoundApplause:(id)sender {
	AudioServicesPlaySystemSound (self.sound_applause_Object);
}


/** play Acheivement sound */
- (IBAction)playSoundAchievement:(id)sender {
	AudioServicesPlaySystemSound (self.sound_achievement_Object);
}




- (void)didReceiveMemoryWarning {
	AudioServicesDisposeSystemSoundID (self.sound_applause_Object);
	CFRelease (sound_applause_Ref);
	
	AudioServicesDisposeSystemSoundID (self.sound_pushup_Object);
	CFRelease (sound_pushup_Ref);
	
	AudioServicesDisposeSystemSoundID (self.sound_achievement_Object);
	CFRelease (sound_achievement_Ref);
	
	[statusText release];
	
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    

}


- (void)dealloc {
	AudioServicesDisposeSystemSoundID (self.sound_applause_Object);
	CFRelease (sound_applause_Ref);
	
	AudioServicesDisposeSystemSoundID (self.sound_pushup_Object);
	CFRelease (sound_pushup_Ref);
	
	AudioServicesDisposeSystemSoundID (self.sound_achievement_Object);
	CFRelease (sound_achievement_Ref);
	
	[statusText release];
    [super dealloc];
}


@end
