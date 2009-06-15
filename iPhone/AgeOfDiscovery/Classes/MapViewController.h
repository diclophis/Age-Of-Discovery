#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKMapViewDelegate> {
	NSUserDefaults *defaults;
	IBOutlet MKMapView *mapView;
	BOOL needsHomePort;
	NSString *homePort;
	IBOutlet UILabel *promptLabel;
	NSString *requestedPort;
}


@property (nonatomic, retain) NSUserDefaults *defaults;
@property BOOL needsHomePort;
@property (nonatomic, retain) NSString *homePort;
@property (nonatomic, retain) NSString *requestedPort;


-(void)selectHomePort:(NSString *)theHomePortKey;


@end
