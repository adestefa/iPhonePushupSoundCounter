//
//  PushupSoundCounterViewController.h
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushupSoundCounterViewController : UIViewController <UITextFieldDelegate>  {
	
	IBOutlet UILabel *labelFld;
	IBOutlet UITextField *txtFld;
	NSString *string;
	
}

@property (nonatomic, retain) UILabel *labelFld;
@property (nonatomic, retain) UITextField *txtFld;
@property (nonatomic, copy) NSString *string;

- (IBAction) goToSection1;

@end



