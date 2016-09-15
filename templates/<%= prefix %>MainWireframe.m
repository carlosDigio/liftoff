//
//  <%= prefix %>MainWireframe.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>MainWireframe.h"
#import "<%= prefix %>MainInteractor.h"
#import "<%= prefix %>MainPresenter.h"
#import "<%= prefix %>MainViewController.h"
#import "<%= prefix %>Repository.h"
#import "<%= prefix %>NetworkClient.h"

@implementation <%= prefix %>MainWireframe

#pragma mark - Public methods

- (UIViewController *)mainViewController
{
    <%= prefix %>NetworkClient *networkClient = [<%= prefix %>NetworkClient sharedManager];
    <%= prefix %>Repository *repository = [[<%= prefix %>Repository alloc] initWithNetworkClient:networkClient];
    
    <%= prefix %>MainInteractor *interactor = [[<%= prefix %>MainInteractor alloc] initWithRepository:repository];
    <%= prefix %>MainPresenter *presenter = [[<%= prefix %>MainPresenter alloc] initWithInteractor:interactor wireframe:self];
    <%= prefix %>MainViewController *view = [[<%= prefix %>MainViewController alloc] initWithPresenter:presenter];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:view];
    
    return navigationController;
}

@end
