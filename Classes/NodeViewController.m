//
//  NodeViewController.m
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import "NodeViewController.h"
#import "DIOSNode.h"
#import "DIOSComment.h"
#import "DIOSFile.h"
#import "DIOSConfig.h"
@implementation NodeViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  delegate = (DIOSExampleAppDelegate*)[[UIApplication sharedApplication] delegate];
}
- (IBAction) saveNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:[delegate session]];
  NSMutableDictionary *nodeData = [[NSMutableDictionary alloc] init];
  // Drupal 7 Version
  //In Drupal 7 body is required to be setup a tad bit differently.
  //if running drupal 7 uncomment these lines  
  /*
  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[bodySaveField text], nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:DRUPAL_LANGUAGE];
  [nodeData setObject:languageDict forKey:@"body"];
  [nodeData setObject:DRUPAL_LANGUAGE forKey:@"language"];
  [nodeData setObject:[typeSaveField text] forKey:@"type"];
  [nodeData setObject:[titleSaveField text] forKey:@"title"];
   */
  // Drupal 6 Version
    [nodeData setObject:[bodySaveField text] forKey:@"body"];
    [nodeData setObject:[typeSaveField text] forKey:@"type"];
    [nodeData setObject:[titleSaveField text] forKey:@"title"];
    [nodeData setObject:[nidSaveField text] forKey:@"nid"];
  
  [nodeData setObject:@"now" forKey:@"date"];
  [nodeData setObject:@"1" forKey:@"status"];
  [nodeData setObject:@"1" forKey:@"status"];
  [node nodeSave:nodeData];
  [self displayDebugDIOS:node];
  [node release];
}

- (IBAction)saveCCKNode:(id)sender {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:[delegate session]];
  NSMutableDictionary *nodeData = [[NSMutableDictionary alloc] init];
  
  //Example adding information to a CCK TextField
  NSDictionary *fieldBodyValue = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[ipadBodyField text], nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
  NSArray *fieldBodyArray = [NSArray arrayWithObject:fieldBodyValue];
  [nodeData setObject:fieldBodyArray forKey:@"field_ipad_body"];
  
  //Example File Adding to Node
  //Note: This is just to prove as an example, you shouldnt do a fileGet unless absolutely necessary
  //This information should be available to you when you are creting a node for the first time.
  //Just for this example (and to save space in the Interface) I hardcoded this fileId, and use getFile in order to obtain
  //the necessary information
  DIOSFile *file = [[DIOSFile alloc] initWithSession:[delegate session]];
  [file fileGet:@"22"];
  [nodeData setObject:[NSArray arrayWithObject:[[file connResult] objectForKey:@"#data"]] forKey:@"field_image"];
  
  
  [nodeData setObject:[typeCCKSaveField text] forKey:@"type"];
  [nodeData setObject:[titleCCKSaveField text] forKey:@"title"];
  [nodeData setObject:[nidCCKSaveField text] forKey:@"nid"];
  [nodeData setObject:@"now" forKey:@"date"];
  [nodeData setObject:@"1" forKey:@"status"];
  if ([[[[delegate session] userInfo] objectForKey:@"uid"] isEqualToNumber:[NSNumber numberWithInt:0]]) {
    [nodeData setObject:@"" forKey:@"name"];
  } else if([[delegate session] userInfo] == nil){
    [nodeData setObject:@"" forKey:@"name"];
  } else {
    [nodeData setObject:[[[delegate session] userInfo] objectForKey:@"name"] forKey:@"name"];
  }
  [node nodeSave:nodeData];
  [self displayDebugDIOS:node];
  [node release];
}

- (IBAction) getNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:[delegate session]];
  [node nodeGet:[nidGetField text]];
  [self displayDebugDIOS:node];
  [node release];  
}

- (IBAction) deleteNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:[delegate session]];
  [node nodeDelete:[nidDeleteField text]];
  [self displayDebugDIOS:node];
  [node release];  
}

- (IBAction) addComment {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:[delegate session]];
  [comment addComment:[nidCommentAddField text] subject:[subjectCommentAddField text] body:[bodyCommentAddField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getComment {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:[delegate session]];
  [comment getComment:[nidCommentGetField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getCommentCount {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:[delegate session]];
  [comment getCommentCountForNid:[nidCommentCountField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getCommentCountNew {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:[delegate session]];
  [comment getCommentCountNewForNid:[nidCommentCountField text]];
  [self displayDebugDIOS:comment];
  [comment release];   
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
  [titleCCKSaveField release];
  [typeCCKSaveField release];
  [nidCCKSaveField release];
  [super dealloc];
}


@end
