//
//  AddQuestionViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "AddQuestionViewController.h"

@interface AddQuestionViewController ()

@end

@implementation AddQuestionViewController
@synthesize questionTitle;
@synthesize sessionTItle;
@synthesize questionBody;


- (void)viewDidLoad
{
  [super viewDidLoad];
  UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a1 setFrame:CGRectMake(0.0f, 0.0f, 69.0f, 32.0f)];
  [a1 addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
  [a1 setImage:[UIImage imageNamed:@"cancel_button_off.png"] forState:UIControlStateNormal];
  [a1 setImage:[UIImage imageNamed:@"cancel_button_on.png"] forState:UIControlStateHighlighted];
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
  [self dismissModalViewControllerAnimated:YES];
}
- (void)done:(id)sender {
  [questionBody resignFirstResponder];
  [questionTitle resignFirstResponder];
  [sessionTItle resignFirstResponder];
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
	
  HUD.delegate = self;
  HUD.labelText = @"Creating Node";
	
  [HUD show:YES];
  [self createQuestion];
}
- (void)createQuestion {
  DIOSNode *node = [[DIOSNode alloc] init];
  NSMutableDictionary *nodeData = [NSMutableDictionary new];
  [nodeData setValue:[questionTitle text] forKey:@"title"];
  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[questionBody text], nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
  [nodeData setValue:languageDict forKey:@"body"];
  NSDictionary *sessionValue = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[sessionTItle text], nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  NSDictionary *sessionLangDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:sessionValue] forKey:@"und"];
  [nodeData setValue:sessionLangDict forKey:@"field_session_name"];
  [nodeData setValue:@"question" forKey:@"type"];
  [nodeData setValue:@"und" forKey:@"language"];
  [node nodeSave:nodeData success:^(AFHTTPRequestOperation *operation, id responseObject) {
    HUD.labelText = @"Successful";
    [self dismissModalViewControllerAnimated:YES];
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    ALog(@"Failure: %@", [error localizedDescription]);
  }];

}

- (void)viewDidUnload
{
    [self setQuestionBody:nil];
    [self setQuestionTitle:nil];
  [self setSessionTItle:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
