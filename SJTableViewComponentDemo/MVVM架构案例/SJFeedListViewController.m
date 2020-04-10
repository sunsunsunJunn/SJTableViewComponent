//
//  SJFeedListViewController.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController.h"
#import "SJFeedListViewController+Configure.h"
#import <MJRefresh/MJRefresh.h>
#import "SJTableViewController.h"

@interface SJFeedListViewController ()

@end

@implementation SJFeedListViewController

#pragma mark - ViewController LifeCycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initProperties];
  [self configureViews];
}

#pragma mark - Action Methods

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  SJFeedModel *feedModel = self.viewModel.feedModels[indexPath.row];
  NSLog(@"name%@",feedModel.title);
}

- (void)detailButtonClickedInCellModel:(SJFeedImageCellModel *)cellModel {
  SJFeedModel *feedModel = cellModel.feedModel;
  SJTableViewController *viewController = [[SJTableViewController alloc] init];
  viewController.navigationItem.title = feedModel.title;
  [self.navigationController pushViewController:viewController animated:YES];
}

- (void)deleteButtonClickedInCellModel:(SJFeedImageCellModel *)cellModel {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定删除吗？" preferredStyle:UIAlertControllerStyleAlert];
  [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [self.viewModel deleteCellModel:cellModel];
    [self reloadData];
  }]];
  [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
  }]];
  [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Public Methods

- (void)loadNewData {
  self.viewModel.currentCount = 0;
  [self loadFeedListData];
}

- (void)loadMoreData {
  [self loadFeedListData];
}

- (void)reloadData {
  [self.tableView reloadData];
}

- (void)stopRefresh {
  [self.tableView.mj_header endRefreshing];
  [self.tableView.mj_footer endRefreshing];
  self.tableView.mj_footer.hidden = NO;
  
  if (self.viewModel.isLastPage) {
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
  }
}

- (void)loadFeedListData {
  [self.viewModel loadFeedListCompletion:^(NSString * _Nonnull errorMsg) {
    if (errorMsg.length) {
      // toast
    }
    
    [self stopRefresh];
    [self reloadData];
  }];
}

@end
