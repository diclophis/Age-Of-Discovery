//
//  AgeOfDiscoveryAppDelegate.m
//  AgeOfDiscovery
//
//  Created by Jon Bardin on 6/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AgeOfDiscoveryAppDelegate.h"
#import "MapViewController.h"
#import "PortViewController.h"

@implementation AgeOfDiscoveryAppDelegate


@synthesize window;
@synthesize navigationController;
@synthesize characteristicsView;


-(void)applicationDidFinishLaunching:(UIApplication *)application {
	[mapView addObserver:self forKeyPath:@"requestedPort" options:NSKeyValueObservingOptionNew context:nil];
	[window addSubview:[characteristicsView view]];
	//[window addSubview:[navigationController view]];
	//[window addSubview:[mapView view]];
    [window makeKeyAndVisible];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if ([keyPath isEqualToString:@"requestedPort"]) {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:1.0f];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
		[[mapView view] removeFromSuperview];
		[UIView commitAnimations];
	}
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
