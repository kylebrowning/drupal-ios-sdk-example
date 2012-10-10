//
//  WHAppDelegate.m
//  Drupal Questions
//
//  Created by Kyle Browning .
//  Copyright (c) 2012 Workhabit. All rights reserved.
//

#import "WHAppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "DIOSSession.h"
#import "DIOSNode.h"
@interface UINavigationBar (CustomImage)

-(void) applyDefaultStyle;

@end

//Gives us a nice dropshadow.
@implementation UINavigationBar (CustomImage)

-(void)willMoveToWindow:(UIWindow *)newWindow{
  [super willMoveToWindow:newWindow];
  [self applyDefaultStyle];
}

- (void)applyDefaultStyle {
  // add the drop shadow
  self.layer.shadowColor = [[UIColor blackColor] CGColor];
  self.layer.shadowOffset = CGSizeMake(0.0, 4);
  self.layer.shadowOpacity = 0.25;
  self.layer.masksToBounds = NO;
  self.layer.shouldRasterize = YES;
}

@end
@implementation WHAppDelegate

@synthesize window = _window;
@synthesize oauthWebView;
@synthesize requestTokens;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  [[UITableView appearance] setBackgroundColor:[UIColor clearColor]];
  [[UITableView appearance] setSeparatorColor:[UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0]];
  UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
  [background setFrame:CGRectMake(0, 63, 320, 480)];
  [_window addSubview:background];
  
  [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"top_bar_bg_no_text.png"] forBarMetrics:UIBarMetricsDefault];
  [[UITabBar appearance] setTintColor:[UIColor colorWithRed:40.0/255.0 green:40.0/255.0 blue:40.0/255.0 alpha:1]];
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];

  CGRect screenRect = [[UIScreen mainScreen] bounds];
  CGFloat screenWidth = screenRect.size.width;
  CGFloat screenHeight = screenRect.size.height;

  //Lets add our WebView
  oauthWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];

  //Start our DIOSSession with our consumer key and secret.
  //If you are using 2-legged oauth this is all you need!
  [DIOSSession sharedOauthSessionWithURL:@"http://d7.workhabit.com" consumerKey:@"yTkyapFEPAdjkW7G2euvJHhmmsURaYJP" secret:@"ZzJymFtvgCbXwFeEhivtF67M5Pcj4NwJ"];


  //If weve already gotten our access tokens
  //You can pull these out of NSUserDefaults if you want
  //Ive left it commented out to show the oAuth Workflow
  //[[DIOSSession sharedSession] setAccessToken:@"DFSjhdsfSDF" secret:@"SDFLJSDFdfjl"];
  
  //If were using three-legged oauth we need to grab some request tokens
  [DIOSSession getRequestTokensWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    requestTokens = [NSMutableDictionary new];
    NSArray *arr = [operation.responseString componentsSeparatedByCharactersInSet:
                    [NSCharacterSet characterSetWithCharactersInString:@"=&"]];
    if([arr count] == 4) {
      [requestTokens setObject:[arr objectAtIndex:1] forKey:[arr objectAtIndex:0]];
      [requestTokens setObject:[arr objectAtIndex:3] forKey:[arr objectAtIndex:2]];
    } else {
      NSLog(@"failed ahh");
    }
    [_window addSubview:oauthWebView];
    NSString *urlToLoad = [NSString stringWithFormat:@"%@/oauth/authorize?%@", [[DIOSSession sharedSession] baseURL], operation.responseString];
    NSURL *url = [NSURL URLWithString:urlToLoad];
    NSLog(@"loading url :%@", urlToLoad);
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    //Load the request in the UIWebView.
    [oauthWebView loadRequest:requestObj];
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"failed");
  }];
  
  return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
  //If our request tokens were validated, this will get called.
  if ([[url absoluteString] rangeOfString:[requestTokens objectForKey:@"oauth_token"]].location != NSNotFound) {
    [DIOSSession getAccessTokensWithRequestTokens:requestTokens success:^(AFHTTPRequestOperation *operation, id responseObject) {
      NSArray *arr = [operation.responseString componentsSeparatedByCharactersInSet:
                      [NSCharacterSet characterSetWithCharactersInString:@"=&"]];
      if([arr count] == 4) {
        //Lets set our access tokens now
        [[DIOSSession sharedSession] setAccessToken:[arr objectAtIndex:1] secret:[arr objectAtIndex:3]];
        NSDictionary *node = [NSDictionary dictionaryWithObject:@"1" forKey:@"nid"];
        [DIOSNode nodeGet:node success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"%@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"%@", [error localizedDescription]);
        }];
      } else {
        NSLog(@"failed ahh");
      }
      NSLog(@"successfully added accessTokens");
      [oauthWebView removeFromSuperview];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getting access tokens failed");
      [oauthWebView removeFromSuperview];
    }];
  }
  return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
