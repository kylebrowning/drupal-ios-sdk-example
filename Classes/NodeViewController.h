//
//  NodeViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"
#import "DIOSExampleAppDelegate.h"
@interface NodeViewController : UIViewController {
  IBOutlet UITextField *titleSaveField;
  IBOutlet UITextField *bodySaveField;
  IBOutlet UITextField *nidSaveField;
  IBOutlet UITextField *typeSaveField;
  IBOutlet UITextField *nidDeleteField;
  IBOutlet UITextField *nidGetField;
  IBOutlet UITextField *subjectCommentAddField;
  IBOutlet UITextField *bodyCommentAddField;
  IBOutlet UITextField *nidCommentAddField;
  IBOutlet UITextField *nidCommentGetField;  
  IBOutlet UITextField *nidCommentCountField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSExampleAppDelegate *delegate;
}

- (IBAction) saveNode;
- (IBAction) deleteNode;
- (IBAction) getNode;

- (IBAction) addComment;
- (IBAction) getComment;
- (IBAction) getCommentCount;
- (IBAction) getCommentCountNew;
- (void) displayDebugDIOS:(id)aDIOSConnect;
@end
