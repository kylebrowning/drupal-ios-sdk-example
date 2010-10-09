//
//  NodeViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"

@interface NodeViewController : UIViewController {
  IBOutlet UITextField *titleSaveField;
  IBOutlet UITextField *bodySaveField;
  IBOutlet UITextField *nidSaveField;
  IBOutlet UITextField *typeSaveField;
  IBOutlet UITextField *nidDeleteField;
  IBOutlet UITextField *nidGetField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSConnect *session;
}

- (IBAction) save;
- (IBAction) delete;
- (IBAction) get;
- (void) displayDebugDIOS:(id)aDIOSConnect;
@end
