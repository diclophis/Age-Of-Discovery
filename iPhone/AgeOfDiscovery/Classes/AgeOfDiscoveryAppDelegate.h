//
//  AgeOfDiscoveryAppDelegate.h
//  AgeOfDiscovery
//
//  Created by Jon Bardin on 6/13/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MapViewController;
@class PortViewController;
@class CharacteristicsViewController;


@interface AgeOfDiscoveryAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet MapViewController *mapView;
	IBOutlet CharacteristicsViewController *characteristicsView;
	IBOutlet UINavigationController *navigationController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CharacteristicsViewController *characteristicsView;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;


@end

