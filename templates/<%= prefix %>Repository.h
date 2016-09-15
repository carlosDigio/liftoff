//
//  <%= prefix %>Repository.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "<%= prefix %>NetworkClient.h"

@interface <%= prefix %>Repository : NSObject

@property (nonatomic, strong, readonly) <%= prefix %>NetworkClient *networkClient;

- (instancetype)initWithNetworkClient:(<%= prefix %>NetworkClient *)networkClient;

@end
