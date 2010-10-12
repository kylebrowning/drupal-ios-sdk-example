//
//  ViewsViewController.m
//  DIOSExample
//
//  Created by Kyle Browning on 10/11/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import "ViewsViewController.h"
#import "DIOSViews.h"

@implementation ViewsViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
 [super viewDidLoad];
 session = [[DIOSConnect alloc] init];
}

- (IBAction) getView {
  DIOSViews *views = [[DIOSViews alloc] initWithSession:session];
  [views initViews];
  [views addParam:[viewNameField text] forKey:@"view_name"];
  [views addParam:[NSArray arrayWithObjects:[argsField text], nil] forKey:@"args"];
  [views addParam:[displayNameField text] forKey:@"display_id"];
  [views runMethod];
  [self displayDebugDIOS:views];
}
- (void) displayDebugDIOS:(id)aDIOSConnect {
  [responseStatus setText:[aDIOSConnect responseStatusMessage]];
  [responseView setText:[NSString stringWithFormat:@"%@", [aDIOSConnect connResult]]];
  [urlLabel setText:[aDIOSConnect methodUrl]];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
