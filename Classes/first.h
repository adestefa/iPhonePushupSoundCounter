//
//  first.h
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface first : UIViewController {
	IBOutlet UILabel *statusText;

	/** Sound made after pushup */
	CFURLRef		sound_pushup_Ref;
	SystemSoundID    sound_pushup_Object;
	
	/** Sound after 10 pushups */
	CFURLRef		sound_applause_Ref;
	SystemSoundID    sound_applause_Object;
	
	/** Sound after 50 pushups */
	CFURLRef		sound_achievement_Ref;
	SystemSoundID    sound_achievement_Object;


	
	int pushups;
}

@property (nonatomic, retain) UILabel *statusText;



@property (readwrite)   CFURLRef        sound_pushup_Ref;
@property (readonly)    SystemSoundID    sound_pushup_Object;

@property (readwrite)   CFURLRef        sound_achievement_Ref;
@property (readonly)    SystemSoundID    sound_achievement_Object;

@property (readwrite)   CFURLRef        sound_applause_Ref;
@property (readonly)    SystemSoundID    sound_applause_Object;



- (IBAction)playSoundPushup:(id)sender;
- (IBAction)playSoundAchievement:(id)sender;
- (IBAction)playSoundApplause:(id)sender;

- (void) proximityChanged:(NSNotification *)notification ;
- (IBAction) goToHome;
- (IBAction) resetCount;
@end

