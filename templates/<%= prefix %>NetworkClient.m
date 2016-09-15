//
//  <%= prefix %>NetworkClient.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>NetworkClient.h"
#import "<%= prefix %>NetworkClientConstants.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "RACEXTScope.h"

static NSString * const kExample = @"example.asp";

@implementation <%= prefix %>NetworkClient

+ (instancetype)sharedManager
{
    static <%= prefix %>NetworkClient *manager;
    static dispatch_once_t onceToken;
    
    @weakify(self);
    dispatch_once(&onceToken, ^{
        @strongify(self);
        
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
        NSURL *baseURL = [NSURL URLWithString:kNetworkClientBaseURL];
        NSURLSessionConfiguration *sessionConfiguration = [self defaultSessionConfiguration];
        
        manager = [[<%= prefix %>NetworkClient alloc] initWithBaseURL:baseURL
                                       sessionConfiguration:sessionConfiguration];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    
    return manager;
}

#pragma mark - Private methods

+ (NSURLSessionConfiguration *)defaultSessionConfiguration
{
	NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
	sessionConfiguration.timeoutIntervalForRequest = kNetworkClientTimeoutInSeconds;
	return sessionConfiguration;
}

#pragma mark - Public methods

- (RACSignal *)examples
{
    return [self rac_GET:kExample parameters:nil];
}

@end
