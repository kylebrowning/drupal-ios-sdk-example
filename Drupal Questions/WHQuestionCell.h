//
//  WHQuestionCell.h
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WHQuestionCell : UITableViewCell  {
  IBOutlet UILabel *questionTitle;
  IBOutlet UILabel *authorName;
  IBOutlet UILabel *commentCount;
  IBOutlet UILabel *questionBody;
  IBOutlet UILabel *sessionName;
}

@property (strong, nonatomic) IBOutlet UILabel *questionTitle;
@property (strong, nonatomic) IBOutlet UILabel *authorName;
@property (strong, nonatomic) IBOutlet UILabel *commentCount;
@property (strong, nonatomic) IBOutlet UILabel *questionBody;
@property (strong, nonatomic) IBOutlet UILabel *sessionName;
@end
