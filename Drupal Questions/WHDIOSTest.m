//
//  WHDIOSTest.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/16/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//
//
//#import "WHDIOSTest.h"
//
//@implementation WHDIOSTest
//- (void)testNode:(id)sender {
//  DIOSNode *node = [[DIOSNode alloc] init];
//  //  NSMutableDictionary *nodeData = [NSMutableDictionary new];
//  //  [nodeData setValue:@"testtitle" forKey:@"title"];
//  //  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"bodsdfasdfasdy", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
//  //  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
//  //  [nodeData setValue:languageDict forKey:@"body"];
//  //  [nodeData setValue:@"article" forKey:@"type"];
//  //  [nodeData setValue:@"und" forKey:@"language"];
//  //  //  [nodeData setValue:@"admin" forKey:@"name"];
//  //  //  
//  //  //  [nodeData setValue:@"7" forKey:@"uid"];
//  //  //  [node nodeGet:nodeData];
//  //  //  [node nodeUpdate:nodeData];
//  //  //  [node nodeDelete:nodeData];
//  //  [node nodeSave:nodeData];
//  NSMutableDictionary *fileData = [NSMutableDictionary new];
//  NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"bg.png"], 0.5);
//  [fileData setValue:@"temp" forKey:@"name"];
//  [fileData setValue:@"temp.jpg" forKey:@"fileName"];
//  [fileData setValue:imageData forKey:@"fileData"];
//  [fileData setValue:@"image/png" forKey:@"mimetype"];
//  [fileData setValue:@"field_image" forKey:@"field_name"];
//  [fileData setValue:@"4" forKey:@"nid"];
//  [node nodeAttachFile:fileData];
//  //[node nodeIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"5"];
//}
//
//- (void)testComment:(id)sender {
//  DIOSComment *comment = [[DIOSComment alloc] init];
//  //  NSMutableDictionary *commentData = [NSMutableDictionary new];
//  //  NSDictionary *bodyValues = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"commentbody", nil] forKeys:[NSArray arrayWithObjects:@"value", nil]];
//  //  NSDictionary *languageDict = [NSDictionary dictionaryWithObject:[NSArray arrayWithObject:bodyValues] forKey:@"und"];
//  //  [commentData setValue:languageDict forKey:@"comment_body"];
//  //  [commentData setValue:@"subjecte is changed" forKey:@"subject"];
//  //  [commentData setValue:@"und" forKey:@"language"];
//  //  //  [commentData setValue:@"2" forKey:@"cid"];
//  [comment commentIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"2"];
//  
//}
//
//- (void)testUser:(id)sender {
//  DIOSUser *user = [[DIOSUser alloc] initWithDelegate:self];
//  NSMutableDictionary *userData = [NSMutableDictionary new];
//  [userData setValue:@"test" forKey:@"name"];
//  [userData setValue:@"test2@gmail.com" forKey:@"mail"];
//  [userData setValue:@"test" forKey:@"pass"];
//  //[userData setValue:@"56" forKey:@"uid"];
//  //[user userSave:userData];
//  //  [user userGet:userData];
//  //  [user userUpdate:userData];
//  //  [user userIndexWithPage:@"0" fields:nil parameters:nil pageSize:@"2"];
//  //  [user userDelete:userData];
//  
//  [user userLogin:userData];
//  [user userLoginWithUsername:@"username" andPassword:@"password"];
//  //[user userLogout];
//}
//- (void)testTaxonmy:(id)sender {
//  DIOSTaxonomy *taxonomy = [[DIOSTaxonomy alloc] init];
//  //[taxonomy getTreeWithVid:@"1" withParent:nil andMaxDepth:nil];
//  //  [taxonomy selectNodesWithTid:@"1" andLimit:@"2" andPager:nil andOrder:nil];
//  [taxonomy getTermWithTid:@"2"];
//}
//- (void)testFile:(id)sender {
//  DIOSFile *file = [[DIOSFile alloc] initWithDelegate:self];
//  NSMutableDictionary *fileData = [NSMutableDictionary new];
//  [fileData setValue:@"4" forKey:@"fid"];
//  [fileData setValue:@"0" forKey:@"file_contents"];
//  [file fileGet:fileData];
//  
//}
//@end
