//
//  SJFeedListViewController.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController.h"
#import "SJFeedListViewController+Configure.h"
#import "SJFeedListViewController+LogicFlow.h"
#import "SJFeedListViewController+CellModelAdapter.h"
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
  [self loadFeedList];
}

#pragma mark - Action Methods

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"%ld", (long)indexPath.row);
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
    [self deleteCellModel:cellModel];
    [self reloadData];
  }]];
  [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
  }]];
  [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Public Methods

- (void)loadNewData {
  self.currentCount = 0;
  [self loadFeedList];
}

- (void)loadMoreData {
  [self loadFeedList];
}

- (void)reloadData {
  [self.tableView reloadData];
}

- (void)stopRefresh {
  [self.tableView.mj_header endRefreshing];
  [self.tableView.mj_footer endRefreshing];
  self.tableView.mj_footer.hidden = NO;
  
  if (self.isLastPage) {
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
  }
}

@end
