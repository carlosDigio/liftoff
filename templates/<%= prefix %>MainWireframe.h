//
//  <%= prefix %>MainWireframe.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface <%= prefix %>MainWireframe : NSObject

- (UIViewController *)mainViewController;

@end
