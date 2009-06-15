//
//  Port.m
//  AgeOfDiscovery
//
//  Created by Jon Bardin on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Port.h"

@implementation Port


@synthesize location;
@synthesize intent;
@synthesize dictionary;


-(void)dealloc {
	[location release];
	[super dealloc];
}


-(id)initWithDictionary:(NSDictionary *)theDictionary andIntent:(NSString *)theIntent {
	if (self = [super init]) {
		[self setDictionary:theDictionary
		];
		[self setIntent:theIntent];
		CLLocation *theLocation = [[CLLocation alloc] initWithLatitude:[[theDictionary objectForKey:@"Latitude"] floatValue] longitude:[[theDictionary objectForKey:@"Longitude"] floatValue]];
		[self setLocation:theLocation];
		[theLocation release];
	}
	return self;
}


-(CLLocationCoordinate2D)coordinate {
	return [location coordinate];
}


-(NSString *)subtitle {
	if ([intent isEqualToString:@"homePort"]) {
		return [dictionary objectForKey:@"Subtitle"];
	} else {
		return @"wtf";
	}
}

-(NSString *)title {
	if ([intent isEqualToString:@"homePort"]) {
		return [dictionary objectForKey:@"Title"];
	} else {
		return @"wtf";
	}
}


@end
