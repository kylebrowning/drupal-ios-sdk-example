//
//  RegisterViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/16/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "RegisterViewController.h"
#import "DIOSUser.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize emailField;
@synthesize password;
@synthesize usernameField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}
- (IBAction)chooseImage:(id)sender {
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a1 setFrame:CGRectMake(0.0f, 0.0f, 69.0f, 32.0f)];
  [a1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
  [a1 setImage:[UIImage imageNamed:@"back_button_off.png"] forState:UIControlStateNormal];
  [a1 setImage:[UIImage imageNamed:@"back_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random1 = [[UIBarButtonItem alloc] initWithCustomView:a1];
  UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a2 setFrame:CGRectMake(0.0f, 0.0f, 55.0f, 32.0f)];
  [a2 addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
  [a2 setImage:[UIImage imageNamed:@"done_button_off.png"] forState:UIControlStateNormal];
  [a2 setImage:[UIImage imageNamed:@"done_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
  
  self.navigationItem.rightBarButtonItem = random2;
  self.navigationItem.leftBarButtonItem = random1;
}
- (void)back:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}
- (void)done:(id)sender {
  [emailField resignFirstResponder];
  [password resignFirstResponder];
  [usernameField resignFirstResponder];
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
	
  HUD.delegate = self;
  HUD.labelText = @"Creating User";
	
  [HUD show:YES];
  [self createUser];
}
- (void)createUser {
  DIOSUser *user  = [[DIOSUser alloc] init];
  NSMutableDictionary *userData = [NSMutableDictionary new];
  [userData setValue:[usernameField text] forKey:@"name"];
  [userData setValue:[password text] forKey:@"pass"];
  [userData setValue:[emailField text] forKey:@"mail"];
//  [user userSave:userData success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    HUD.labelText = @"Successful";
//    [HUD show:YES];
//    sleep(2);
//    [HUD hide:YES];
//  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    HUD.labelText = [error localizedDescription];
//    [HUD show:YES];
//    sleep(2);
//    [HUD hide:YES];
//  }];
}

- (void)viewDidUnload
{
  [self setEmailField:nil];
  [self setPassword:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
