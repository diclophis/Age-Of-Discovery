#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface CharacteristicsViewController : UIViewController {
	IBOutlet UISlider *leadershipSlider;
	IBOutlet UISlider *wisdomSlider;
	IBOutlet UISlider *intelligenceSlider;
	IBOutlet UIProgressView *remainingProgress;
	float maxLevel;
	float availablePoints;
	float leadershipLevel;
	float wisdomLevel;
	float intelligenceLevel;
}


-(IBAction)didUpdateSlider:(UISlider *)sender;


@end