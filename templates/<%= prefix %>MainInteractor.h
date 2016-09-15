//
//  <%= prefix %>MainInteractor.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa/ReactiveCocoa.h"

@class <%= prefix %>CategoryPresenter;

typedef void(^<%= prefix %>ConfigureCategoryCellBlock)(id cell, <%= prefix %>CategoryPresenter *presenter);

@interface <%= prefix %>MainInteractor : NSObject

@property (nonatomic, strong, readonly) RACSubject *reloadDataSignal;

- (instancetype)initWithRepository:(<%= prefix %>Repository *)repository;

@end
