//
//  DIOSExampleAppDelegate.h
//  DIOSExample
//
//  Created by Kyle Browning on 10/8/10.
//  Copyright 2010 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIOSConnect.h"
@interface DIOSExampleAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
    DIOSConnect *session;
}
@property (nonatomic, retain) DIOSConnect *session;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
