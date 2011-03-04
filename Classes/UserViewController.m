//
//  UserViewController.m
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import "UserViewController.h"
#import "DIOSUser.h"
#import "DIOSExampleAppDelegate.h"
@implementation UserViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  delegate = (DIOSExampleAppDelegate*)[[UIApplication sharedApplication] delegate];
}

-(IBAction) login {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:[delegate session]];
  [user loginWithUsername:[usernameLoginField text] andPassword:[passwordLoginField text]];
  //Since we logged in our main session needs to know the new user information
  if ([[[user connResult] objectForKey:@"user"] objectForKey:@"uid"]) {
    [delegate setSession:user];
  }
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) logout {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:[delegate session]];
  [user logout];
  [self displayDebugDIOS:user];
  if ([user connResult]) {
    [delegate setSession:user];
  }
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) save {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:[delegate session]];
  NSMutableDictionary *userData = [[NSMutableDictionary alloc] init];
  [userData setObject:[usernameSaveField text] forKey:@"name"];
  [userData setObject:[newPasswordSaveField text] forKey:@"pass"];
  [userData setObject:[curPasswordSaveField text] forKey:@"current_pass"];
  [userData setObject:[emailSaveField text] forKey:@"mail"];
  if(![[uidSaveField text] isEqualToString:@""])
  [userData setObject:[uidSaveField text] forKey:@"uid"];
  [user userSave:userData];
  [self displayDebugDIOS:user];
  [user release];
}
-(IBAction) get {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:[delegate session]];
  [user userGet:[uidGetField text]];
  [self displayDebugDIOS:user];
  [user release];
}

-(IBAction) delete {
  DIOSUser *user = [[DIOSUser alloc] initWithSession:[delegate session]];
  [user userDelete:[uidDeleteField text]];
  [self displayDebugDIOS:user];
  [user release];  
}
- (void) displayDebugDIOS:(id)aDIOSConnect {
    [responseStatus setText:[aDIOSConnect responseStatusMessage]];
    if([aDIOSConnect connResult] == nil) {
        if([aDIOSConnect respondsToSelector:@selector(error)]) {
            [responseView setText:[NSString stringWithFormat:@"%@", [aDIOSConnect error]]]; 
        }
    } else {
        [responseView setText:[NSString stringWithFormat:@"%@", [aDIOSConnect connResult]]];
    }
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
