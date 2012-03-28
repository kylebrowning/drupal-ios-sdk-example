//
//  RegisterViewController.h
//  Drupal Questions
//
//  Created by Kyle Browning on 3/16/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "DIOSUser.h"
@interface RegisterViewController : UIViewController <MBProgressHUDDelegate> {
  MBProgressHUD *HUD;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
