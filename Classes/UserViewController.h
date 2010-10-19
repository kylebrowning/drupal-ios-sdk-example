//
//  UserViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"
#import "DIOSExampleAppDelegate.h"
@interface UserViewController : UIViewController {
  IBOutlet UITextField *usernameLoginField;
  IBOutlet UITextField *passwordLoginField;
  IBOutlet UITextField *usernameSaveField;
  IBOutlet UITextField *passwordSaveField;
  IBOutlet UITextField *emailSaveField;
  IBOutlet UITextField *uidSaveField;
  IBOutlet UITextField *uidGetField;
  IBOutlet UITextField *uidDeleteField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSExampleAppDelegate *delegate;
}
-(IBAction) login;
-(IBAction) logout;
-(IBAction) save;
-(IBAction) delete;
-(IBAction) get;
-(void) displayDebugDIOS:(id)aDIOSConnect;
@end
