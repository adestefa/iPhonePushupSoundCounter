![alt tag](https://github.com/adestefa/iPhonePushupSoundCounter/blob/master/Default.png)


# iPhonePushupSoundCounter

Way back in early 2010, I had the idea to use the proximity sensor on the first iPhone--which is used to turn the phone's screen off when you hold it up to your ear to save battery life--what if I could use that to count pushups?

You can focus on your breathing and proper form instead of counting. Place the phone on the floor under your chest and every time you complete a full pushup the phone will count for you. You will hear a sound every time a full push-up is completed giving you the right amount of feedback and motivation. Drums and cymbals sound every 10 giving you the incentive to keep going those last few to hear the sound of your success. It becomes very addictive.

Although it was an undocumented feature, after some digging around I found the actual code to capture the proximity sensor events was very simple:

	UIDevice *device = [UIDevice currentDevice];
	device.proximityMonitoringEnabled = YES;
	if (device.proximityMonitoringEnabled == YES){
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:@"UIDeviceProximityStateDidChangeNotification" object:device];

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
		


	
	
	

![alt tag](https://github.com/adestefa/iPhonePushupSoundCounter/blob/master/PushupSoundCounterScreen1.png)

![alt tag](https://github.com/adestefa/iPhonePushupSoundCounter/blob/master/PushupSoundCounterScreen3.png)
