//
//  PushupSoundCounterViewController.m
//  PushupSoundCounter
//
//  Created by Anthony on 5/4/10.
//  Copyright Anthony Destefano 2010. All rights reserved.
//

#import "PushupSoundCounterViewController.h"
#import "first.h"



@implementation PushupSoundCounterViewController



@synthesize labelFld;
@synthesize txtFld;
@synthesize string;

- (IBAction) goToSection1{
	first *sec1 = [[first alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:sec1 animated:YES];
}	


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	// load last save
	//myPushups = [[NSUserDefaults standardUserDefaults] floatForKey:@"pushups"];
	//NSString *mystr = [[NSString alloc] initWithFormat:@"%d",myPushups];
	//[lastText setText:mystr];
	[super viewDidLoad];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
	
    [super dealloc];
}

@end
