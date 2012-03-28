//
//  WHQuestionsRootViewController.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "WHQuestionsRootViewController.h"
#import "DIOSNode.h"
@interface WHQuestionsRootViewController ()

@end

@implementation WHQuestionsRootViewController
@synthesize questions = _questions;

- (void) pullQuestions {
  DIOSView *view = [[DIOSView alloc] init];
  NSMutableDictionary *viewParams = [NSMutableDictionary new];
  [viewParams setValue:@"questions_view" forKey:@"view_name"];
  [view viewGet:viewParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
    _questions = responseObject;
    [self.tableView reloadData];
    [HUD hide:YES];
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    ALog(@"Failure: %@", [error localizedDescription]);
  }];
}
- (IBAction)addQuestion:(id)sender {
  [self performSegueWithIdentifier:@"addQuestion" sender:sender];
}
- (IBAction)showSettings:(id)sender {
  [self performSegueWithIdentifier:@"showSettings" sender:sender];
}
- (void)viewGetDidFinish:(BOOL)status operation:(AFHTTPRequestOperation *)operation response:(id)response error:(NSError*)error {
  _questions = response;
  [self.tableView reloadData];
  [HUD hide:YES];
}
- (void) viewDidAppear:(BOOL)animated {
  HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
	
  HUD.delegate = self;
  HUD.labelText = @"Loading";
	
  [HUD show:YES];
  [self pullQuestions];
}
- (void)viewDidLoad
{
  [super viewDidLoad];
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  UIButton *a1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a1 setFrame:CGRectMake(0.0f, 0.0f, 34.0f, 32.0f)];
  [a1 addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
  [a1 setImage:[UIImage imageNamed:@"settings_button_off.png"] forState:UIControlStateNormal];
  [a1 setImage:[UIImage imageNamed:@"settings_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random = [[UIBarButtonItem alloc] initWithCustomView:a1];
  
  UIButton *a2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [a2 setFrame:CGRectMake(0.0f, 0.0f, 34.0f, 32.0f)];
  [a2 addTarget:self action:@selector(addQuestion:) forControlEvents:UIControlEventTouchUpInside];
  [a2 setImage:[UIImage imageNamed:@"add_button_off.png"] forState:UIControlStateNormal];
  [a2 setImage:[UIImage imageNamed:@"add_button_on.png"] forState:UIControlStateHighlighted];
  UIBarButtonItem *random2 = [[UIBarButtonItem alloc] initWithCustomView:a2];
  
  self.navigationItem.rightBarButtonItem = random2;
  self.navigationItem.leftBarButtonItem = random;
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  [self setTitle:@"Questions"];
  [self setQuestions:[NSArray new]];
  [self pullQuestions];
  DIOSNode *node = [[DIOSNode alloc] init];
  NSMutableDictionary *nodeData = [NSMutableDictionary new];
  [nodeData setValue:@"5" forKey:@"nid"];
  [node nodeGet:nodeData success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //Do Something with the responseObject
    NSLog(@"%@", responseObject);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //we failed, uh-oh lets error log this.
    NSLog(@"%@,  %@", [error localizedDescription], [operation responseString]);
  }];
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [_questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"questioncell";
  WHQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  // Configure the cell...
  NSDictionary *node = [_questions  objectAtIndex:indexPath.row];
  [[cell questionTitle] setText:[node objectForKey:@"node_title"]];
  [[cell sessionName] setText:[[[[node objectForKey:@"field_field_session_name"] objectAtIndex:0] objectForKey:@"raw"] objectForKey:@"value"]];
  [[cell commentCount] setText:[node objectForKey:@"node_comment_statistics_comment_count"]];
  [[cell questionBody] setText:[[[[node objectForKey:@"field_body"] objectAtIndex:0] objectForKey:@"raw"] objectForKey:@"value"]];
  [[cell authorName] setText:[node objectForKey:@"users_node_name"]];
  return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   */
}

@end
