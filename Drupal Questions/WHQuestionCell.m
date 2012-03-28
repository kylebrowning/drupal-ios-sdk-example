//
//  WHQuestionCell.m
//  Drupal Questions
//
//  Created by Kyle Browning on 3/15/12.
//  Copyright (c) 2012 Grasscove. All rights reserved.
//

#import "WHQuestionCell.h"

@implementation WHQuestionCell
@synthesize questionTitle, commentCount, sessionName, questionBody, authorName;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
