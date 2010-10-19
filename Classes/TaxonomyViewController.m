    //
//  TaxonomyViewController.m
//  DIOSExample
//
//  Created by Kyle Browning on 10/12/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import "TaxonomyViewController.h"
#import "DIOSTaxonomy.h"
#import "DIOSExampleAppDelegate.h"
@implementation TaxonomyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  delegate = (DIOSExampleAppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (IBAction) getTree {

  DIOSTaxonomy *taxonomy = [[DIOSTaxonomy alloc] initWithSession:[delegate session]];
  [taxonomy getTree:[vidGetField text]];
  [self displayDebugDIOS:taxonomy];
  [taxonomy release];
}
- (IBAction) selectNodes {
  DIOSTaxonomy *taxonomy = [[DIOSTaxonomy alloc] initWithSession:[delegate session]];
  [taxonomy selectNodes:[tidSelectField text]];
  [self displayDebugDIOS:taxonomy];
  [taxonomy release];  
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
