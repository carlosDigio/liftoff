//
//  <%= prefix %>Repository.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>Repository.h"
#import "MagicalRecord/MagicalRecord.h"
#import "Groot/Groot.h"

@interface <%= prefix %>Repository ()

@property (nonatomic, strong, readwrite) <%= prefix %>NetworkClient *networkClient;

@end

@implementation <%= prefix %>Repository

- (instancetype)initWithNetworkClient:(<%= prefix %>NetworkClient *)networkClient
{
    self = [super init];
    if (self) {
        _networkClient = networkClient;
    }
    
    return self;
}

+ (void)initialize
{
    [super initialize];
    
    [self setupMagicalRecord];
}

#pragma mark - Private methods

+ (void)setupMagicalRecord
{
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    [self setupJSONTransformers];
}

+ (void)setupJSONTransformers
{
    [NSValueTransformer grt_setValueTransformerWithName:@"StringToURL" transformBlock:^id _Nullable(id  _Nonnull value) {
        NSString *urlString = value;
        NSURL *url = [NSURL URLWithString:urlString];
        return url;
    } reverseTransformBlock:^id _Nullable(id  _Nonnull value) {
        NSURL *url = value;
        return url.absoluteString;
    }];
    
    [NSValueTransformer grt_setValueTransformerWithName:@"StringToNumber" transformBlock:^id _Nullable(id  _Nonnull value) {
        NSString *numberString = value;
        return @([numberString longLongValue]);
        
    } reverseTransformBlock:^id _Nullable(id  _Nonnull value) {
        NSNumber *number = value;
        return [number stringValue];
    }];
}

@end
