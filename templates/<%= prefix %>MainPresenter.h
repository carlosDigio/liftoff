//
//  <%= prefix %>MainPresenter.h
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "<%= prefix %>MainInteractor.h"
#import "<%= prefix %>MainWireframe.h"

@interface <%= prefix %>MainPresenter : NSObject

@property (nonatomic, strong, readonly) RACSubject *reloadDataSignal;

- (instancetype)initWithInteractor:(<%= prefix %>MainInteractor *)interactor
                         wireframe:(<%= prefix %>MainWireframe *)wireframe;

@end
