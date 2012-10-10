//
//  WHAppDelegate.h
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWebView *oauthWebView;
@property (strong, nonatomic) NSMutableDictionary *requestTokens;
@end
