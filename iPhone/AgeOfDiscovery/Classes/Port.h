//
//  Port.h
//  AgeOfDiscovery
//
//  Created by Jon Bardin on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Port : NSObject <MKAnnotation> {
	CLLocation *location;
	NSString *intent;
	NSDictionary *dictionary;
}


@property (nonatomic, retain) CLLocation *location;
@property (nonatomic, retain) NSString *intent;
@property (nonatomic, retain) NSDictionary *dictionary;

-(id)initWithDictionary:(NSDictionary *)theDictionary andIntent:(NSString *)theIntent;


@end
