//
//  FileViewController.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/11/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"

@interface FileViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
  IBOutlet UIImageView *imageView;
  IBOutlet UIImageView *imageViewGet;
  UIPopoverController *popover;
  IBOutlet UIButton *uploadButton;
  NSData *imageData;
  IBOutlet UITextField *fileIdField;
  IBOutlet UITextField *nodeIdField;
  IBOutlet UILabel *responseStatus;
  IBOutlet UITextView *responseView;
  IBOutlet UILabel *urlLabel;
  DIOSConnect *session;
}
@property (nonatomic, retain) NSData *imageData;

-(IBAction) getFile:(id) sender;
-(IBAction) getPhoto:(id) sender;
-(IBAction) uploadPhoto;
-(IBAction) getNodeFiles:(id) sender;
- (void) displayDebugDIOS:(id)aDIOSConnect;
@end
