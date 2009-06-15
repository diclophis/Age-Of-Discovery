#import "CharacteristicsViewController.h"


@implementation CharacteristicsViewController


-(void)viewDidLoad {
	[leadershipSlider setTag:1];
	[wisdomSlider setTag:2];
	[intelligenceSlider setTag:3];
}


-(void)viewWillAppear:(BOOL)animated {
	maxLevel = 100.0f;
	availablePoints = 100.0f;
	leadershipLevel = 1.0f;
	wisdomLevel = 1.0f;
	intelligenceLevel = 1.0f;
	
	[remainingProgress setProgress:1.0f];
	
	
	[leadershipSlider setValue:leadershipLevel animated:YES];
	[wisdomSlider setValue:wisdomLevel animated:YES];
	[intelligenceSlider setValue:intelligenceLevel animated:YES];
	
}


-(IBAction)didUpdateSlider:(UISlider *)sender {
	float progress;
	float tweaked;
	float used;
	float new = [sender value];
	new = ceil(new);
	if (new >= availablePoints) {
		new = availablePoints;
	}
	
	if ([sender tag] == 1) {
		used = new + wisdomLevel + intelligenceLevel;
	} else if ([sender tag] == 2) {
		used = new + leadershipLevel + intelligenceLevel;
	} else if ([sender tag] == 3) {
		used = new + leadershipLevel + wisdomLevel;
	}
	
	used = round(used);
	
	if (used > availablePoints) {
		if ([sender tag] == 1) {
			tweaked = availablePoints - (wisdomLevel + intelligenceLevel);
			[leadershipSlider setValue:tweaked animated:NO];
		} else if ([sender tag] == 2) {
			tweaked = availablePoints - (leadershipLevel + intelligenceLevel);
			[wisdomSlider setValue:tweaked animated:NO];
		} else if ([sender tag] == 3) {
			tweaked = availablePoints - (leadershipLevel + wisdomLevel);
			[intelligenceSlider setValue:tweaked animated:NO];
		}
		used = availablePoints;
	} else {
		tweaked = new;
	}
	
	if ([sender tag] == 1) {
		leadershipLevel = tweaked;
	} else if ([sender tag] == 2) {
		wisdomLevel = tweaked;
	} else if ([sender tag] == 3) {
		intelligenceLevel = tweaked;
	}
	
	progress = (1.0f - ((leadershipLevel + wisdomLevel + intelligenceLevel) / availablePoints));
	
	[remainingProgress setProgress:progress];
}


@end
