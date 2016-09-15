//
//  <%= prefix %>MainViewController.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "<%= prefix %>MainPresenter.h"

@interface <%= prefix %>MainViewController : UITableViewController

- (instancetype)initWithPresenter:(<%= prefix %>MainPresenter *)presenter;

@end
