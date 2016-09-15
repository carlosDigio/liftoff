//
//  <%= prefix %>NetworkClient.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AFHTTPSessionManager+RACSupport.h"

@interface <%= prefix %>NetworkClient : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (RACSignal *)examples;

@end
