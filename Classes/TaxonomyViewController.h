//
//  TaxonomyViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/12/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"
#import "DIOSExampleAppDelegate.h"
@interface TaxonomyViewController : UIViewController {
  DIOSConnect *session;
  IBOutlet UITextField *vidGetField;
  IBOutlet UITextField *tidSelectField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSExampleAppDelegate *delegate;
}
- (IBAction) getTree;
- (IBAction) selectNodes;
- (void) displayDebugDIOS:(id)aDIOSConnect;
@end
