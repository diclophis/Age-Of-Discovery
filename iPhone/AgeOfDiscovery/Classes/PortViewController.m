//
//  PortViewController.m
//  AgeOfDiscovery
//
//  Created by Jon Bardin on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PortViewController.h"


@implementation PortViewController


@synthesize menu;


-(void)viewDidLoad {
	[self setMenu:[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PortMenu" ofType:@"plist"]]];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [menu count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[menu objectAtIndex:section] objectForKey:@"Actions"] count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[menu objectAtIndex:section] objectForKey:@"Title"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
	if (cell == nil) {
		CGRect frame = CGRectMake(0, 0, 480, 70);
		cell = [[[UITableViewCell alloc] initWithFrame:frame reuseIdentifier:@"itemCell"] autorelease];
		[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	}

	
	[[cell textLabel] setText:[[[menu objectAtIndex:[indexPath section]] objectForKey:@"Actions"] objectAtIndex:[indexPath row]]];
	
	
	return cell;	
}


/*
-(id)init {
	if (self = [super initWithNibName:@"PortViewController" bundle:[NSBundle mainBundle]]) {
		//
	}
	return self;
}
 */


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
