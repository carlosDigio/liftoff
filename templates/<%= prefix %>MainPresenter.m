//
//  <%= prefix %>MainPresenter.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>MainPresenter.h"

@interface <%= prefix %>MainPresenter ()

@property (nonatomic, strong) <%= prefix %>MainInteractor *interactor;
@property (nonatomic, strong) <%= prefix %>MainWireframe *wireframe;

@end

@implementation <%= prefix %>MainPresenter

- (instancetype)initWithInteractor:(<%= prefix %>MainInteractor *)interactor
                         wireframe:(<%= prefix %>MainWireframe *)wireframe
{
    self = [super init];
    if (self) {
        _interactor = interactor;
        _wireframe = wireframe;
    }
    
    return self;
}

#pragma mark - Public methods

- (RACSubject *)reloadDataSignal
{
    return self.interactor.reloadDataSignal;
}

@end
