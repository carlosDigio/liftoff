//
//  <%= prefix %>MainInteractor.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>MainInteractor.h"
#import <CoreData/CoreData.h>
#import "TGRDataSource/TGRFetchedResultsDataSource.h"
#import "<%= prefix %>CategoryInteractor.h"
#import "<%= prefix %>CategoryPresenter.h"

@interface <%= prefix %>MainInteractor () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) <%= prefix %>Repository *repository;
@property (nonatomic, strong, readwrite) RACSubject *reloadDataSignal;
@property (nonatomic, strong) NSFetchedResultsController *fetchedController;
@property (nonatomic, strong) TGRFetchedResultsDataSource *dataSource;

@end

@implementation <%= prefix %>MainInteractor

- (instancetype)initWithRepository:(<%= prefix %>Repository *)repository
{
    self = [super init];
    if (self) {
        _repository = repository;
        _reloadDataSignal = [RACSubject subject];
    }
    
    return self;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.reloadDataSignal sendNext:nil];
}

@end
