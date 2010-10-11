//
//  ViewsViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/11/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"

@interface ViewsViewController : UIViewController {
  IBOutlet UITextField *viewNameField;
  IBOutlet UITextField *displayNameField;
  IBOutlet UITextField *argsField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSConnect *session;
}

- (IBAction) getView;
- (void) displayDebugDIOS:(id)aDIOSConnect;
@end
