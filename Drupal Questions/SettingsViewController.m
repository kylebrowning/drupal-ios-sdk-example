//
//  SettingsViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/16/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "SettingsViewController.h"
#import "DIOSSession.h"
#import "DIOSUser.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a1 setFrame:CGRectMake(0.0f, 0.0f, 69.0f, 32.0f)];
  NSLog(@"%@", [[DIOSSession sharedSession] user]);
  if([[DIOSSession sharedSession] user] != nil) {
    [a1 addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [a1 setImage:[UIImage imageNamed:@"logout_button_off.png"] forState:UIControlStateNormal];
    [a1 setImage:[UIImage imageNamed:@"logout_button_on.png"] forState:UIControlStateHighlighted];
  } else {
    [a1 addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [a1 setImage:[UIImage imageNamed:@"login_button_off.png"] forState:UIControlStateNormal];
    [a1 setImage:[UIImage imageNamed:@"login_button_on.png"] forState:UIControlStateHighlighted];    
  }
	// Do any additional setup after loading the view.

  UIBarButtonItem *random1 = [[UIBarButtonItem alloc] initWithCustomView:a1];
  UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a2 setFrame:CGRectMake(0.0f, 0.0f, 82.0f, 32.0f)];
  [a2 addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
  [a2 setImage:[UIImage imageNamed:@"register_button_off.png"] forState:UIControlStateNormal];
  [a2 setImage:[UIImage imageNamed:@"register_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
  if([[DIOSSession sharedSession] user] != nil) {
    self.navigationItem.leftBarButtonItem = random2;
  } else {
    self.navigationItem.leftBarButtonItem = nil;
  }
  self.navigationItem.rightBarButtonItem = random1;
}
- (void) registerUser:(id)sender {
    [self performSegueWithIdentifier:@"registerUser" sender:sender];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void) login:(id)sender {

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
