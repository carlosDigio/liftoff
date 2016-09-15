//
//  <%= prefix %>NetworkClientConstants.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>NetworkClientConstants.h"
#import <Foundation/Foundation.h>

extern NSString * const kNetworkClientBaseURL;
extern NSUInteger const kNetworkClientTimeoutInSeconds;

@interface <%= prefix %>NetworkClientConstants : NSObject

@end
