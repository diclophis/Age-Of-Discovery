//JonBardin

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"
#import "Port.h"


@implementation MapViewController


@synthesize defaults;
@synthesize needsHomePort;
@synthesize homePort;
@synthesize requestedPort;


-(void)dealloc {
	[defaults release];
	[homePort release];
	[requestedPort release];
	[super dealloc];
}


-(id)initWithCoder:(NSCoder *)theCoder {
	if (self = [super initWithCoder:theCoder]) {
		[self setDefaults:[NSUserDefaults standardUserDefaults]];
		[self setHomePort:[defaults objectForKey:@"homePort"]];
		if (homePort == nil) {
			[self setNeedsHomePort:YES];
		} else {
			[self setNeedsHomePort:NO];
		}
	}
	return self;
}


-(void)viewDidLoad {
	[mapView setRegion:MKCoordinateRegionMake([[[CLLocation alloc] initWithLatitude:41.39793f longitude:2.1698f] coordinate], MKCoordinateSpanMake(15.0f, 15.0f))];
	[mapView setZoomEnabled:NO];
}


-(void)viewWillAppear:(BOOL)animated {
	if (needsHomePort) {
		[promptLabel setText:@"Select Your Home Port"];
		NSDictionary *ports = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Ports" ofType:@"plist"]];
		for (NSString *portKey in ports) {
			Port *thePort = [[Port alloc] initWithDictionary:[ports objectForKey:portKey] andIntent:@"homePort"];
			[mapView addAnnotation:thePort];
			[thePort release];
		}
	}
}


-(void)mapView:(MKMapView *)theMapView annotationView:(MKAnnotationView *)annotationView calloutAccessoryControlTapped:(UIControl *)control {
	if (needsHomePort) {
		[self selectHomePort:[[annotationView annotation] title]];
	}
}


-(void)selectHomePort:(NSString *)theHomePortKey {
	//[defaults setObject:theHomePortKey forKey:@"homePort"];
	//[defaults synchronize];
	[self setNeedsHomePort:NO];
	[self setRequestedPort:theHomePortKey];
}


-(MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
	MKAnnotationView *theAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"port"];	
	[theAnnotationView setCanShowCallout:YES];
	[theAnnotationView setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
	return theAnnotationView;
}


@end
