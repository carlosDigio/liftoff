//
//  <%= prefix %>MainViewController.m
//  <%= project_name %>
//
//  Created by <%= author %> on <%= Time.now.strftime("%-m/%-d/%y") %>
//  Copyright (c) <%= Time.now.strftime('%Y') %> <%= company %>. All rights reserved.
//

#import "<%= prefix %>MainViewController.h"

@interface <%= prefix %>MainViewController ()

@property (nonatomic, strong) <%= prefix %>MainPresenter *presenter;

@end

@implementation <%= prefix %>MainViewController

- (instancetype)initWithPresenter:(<%= prefix %>MainPresenter *)presenter
{
    self = [super init];
    if (self) {
        _presenter = presenter;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureTableView];
    [self bindPresenter];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO
}

#pragma mark - Private methods

- (void)configureTableView
{
	// TODO
	
	UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self
                       action:@selector(handleRefreshControl:)
             forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
}

- (void)bindPresenter
{
	// TODO
	
	@weakify(self);
    [self.presenter.reloadDataSignal subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

#pragma mark - Actions

- (void)handleRefreshControl:(UIRefreshControl *)refreshControl
{
    @weakify(self);
    [[self.presenter requestCategories] subscribeNext:^(id x) {
        [refreshControl endRefreshing];
		
    } error:^(NSError *error) {
        @strongify(self);
        [refreshControl endRefreshing];
        
        [self showAlertError:error];
    }];
}

#pragma mark - Utility methods

- (void)showAlertError:(NSError *)error
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:error.localizedDescription
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
