//
//  NSData+JSON.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "NSData+JSON.h"

@implementation NSData (JSON)

- (id)biz_toJSON
{
    NSString *string = [[NSString alloc] initWithData:self encoding:NSWindowsCP1252StringEncoding];
    NSData *utf8Data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:utf8Data options:0 error:nil];
}

@end
