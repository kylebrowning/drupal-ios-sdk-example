//
//  AddQuestionViewController.h
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "DIOSNode.h"
@interface AddQuestionViewController : UIViewController <MBProgressHUDDelegate> {
  	MBProgressHUD *HUD;
}

@property (weak, nonatomic) IBOutlet UITextField *questionTitle;
@property (weak, nonatomic) IBOutlet UITextField *sessionTItle;
@property (weak, nonatomic) IBOutlet UITextView *questionBody;
@end
