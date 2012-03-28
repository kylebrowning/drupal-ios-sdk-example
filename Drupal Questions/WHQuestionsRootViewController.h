//
//  WHQuestionsRootViewController.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSUser.h"
#import "DIOSView.h"
#import "WHQuestionCell.h"
#import "MBProgressHUD.h"
@interface WHQuestionsRootViewController : UITableViewController <MBProgressHUDDelegate> {
  NSArray *questions;
  MBProgressHUD *HUD;
}
@property (nonatomic, strong) NSArray *questions;
@end
