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
#import "DIOSExampleAppDelegate.h"
@implementation NodeViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  DIOSExampleAppDelegate *delegate = (DIOSExampleAppDelegate*)[[UIApplication sharedApplication] delegate];
  session = [delegate session];
}
- (IBAction) saveNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:session];
  NSMutableDictionary *nodeData = [[NSMutableDictionary alloc] init];
  [nodeData setObject:[bodySaveField text] forKey:@"body"];
  [nodeData setObject:[typeSaveField text] forKey:@"type"];
  [nodeData setObject:[titleSaveField text] forKey:@"title"];
  [nodeData setObject:[nidSaveField text] forKey:@"nid"];
  [nodeData setObject:@"now" forKey:@"date"];
  [nodeData setObject:@"1" forKey:@"status"];
  [nodeData setObject:[[session userInfo] objectForKey:@"name"] forKey:@"name"];
  [node nodeSave:nodeData];
  [self displayDebugDIOS:node];
  [node release];
}

- (IBAction) getNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:session];
  [node nodeGet:[nidGetField text]];
  [self displayDebugDIOS:node];
  [node release];  
}

- (IBAction) deleteNode {
  DIOSNode *node = [[DIOSNode alloc] initWithSession:session];
  [node nodeDelete:[nidDeleteField text]];
  [self displayDebugDIOS:node];
  [node release];  
}

- (IBAction) addComment {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:session];
  [comment addComment:[nidCommentAddField text] subject:[subjectCommentAddField text] body:[bodyCommentAddField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getComment {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:session];
  [comment getComment:[nidCommentGetField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getCommentCount {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:session];
  [comment getCommentCountForNid:[nidCommentCountField text]];
  [self displayDebugDIOS:comment];
  [comment release]; 
}
- (IBAction) getCommentCountNew {
  DIOSComment *comment = [[DIOSComment alloc] initWithSession:session];
  [comment getCommentCountNewForNid:[nidCommentCountField text]];
  [self displayDebugDIOS:comment];
  [comment release];   
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
