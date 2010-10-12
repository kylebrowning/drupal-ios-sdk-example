//
//  UserViewController.m
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import "UserViewController.h"
#import "DIOSUser.h"

@implementation UserViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  session = [[DIOSConnect alloc] init];
}

-(IBAction) login {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  [user loginWithUsername:[usernameLoginField text] andPassword:[passwordLoginField text]];
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) logout {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  [user logout];
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) save {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  NSMutableDictionary *userData = [[NSMutableDictionary alloc] init];
  [userData setObject:[usernameSaveField text] forKey:@"name"];
  [userData setObject:[passwordSaveField text] forKey:@"pass"];
  [userData setObject:[emailSaveField text] forKey:@"mail"];
  [userData setObject:[uidSaveField text] forKey:@"uid"];
  [user userSave:userData];
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) get {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  [user userGet:[uidGetField text]];
  [self displayDebugDIOS:user];
  [user release];
}

-(IBAction) delete {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  [user userDelete:[uidDeleteField text]];
  [self displayDebugDIOS:user];
  [user release];  
}
-(void) displayDebugDIOS:(id)aDIOSConnect {
  [responseStatus setText:[aDIOSConnect responseStatusMessage]];
  [responseView setText:[NSString stringWithFormat:@"%@", [aDIOSConnect connResult]]];
  [urlLabel setText:[aDIOSConnect methodUrl]];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Overriden to allow any orientation.
  return YES;
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
