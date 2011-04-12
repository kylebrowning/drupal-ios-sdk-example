//
//  tests.m
//  tests
//
//  Created by Kyle Browning on 4/11/11.
//  Copyright 2011 Grasscove. All rights reserved.
//

#import "tests.h"
#import "DIOSConnect.h"
#import "DIOSUser.h"
@implementation tests

- (void)setUp
{
    [super setUp];
    session = [[DIOSConnect alloc] init];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testSessionConnect
{
    STAssertNotNil([session sessid], @"Session id was Nil, something went wrong");
}
- (void)testSessionLogin
{
  DIOSUser *user = [[DIOSUser alloc] initWithSession:session];
  [user loginWithUsername:@"test" andPassword:@"test"];
  STAssertNotNil([user userInfo], @"userInfo Found");
  
}
@end
