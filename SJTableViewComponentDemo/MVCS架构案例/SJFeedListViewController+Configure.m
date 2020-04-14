//
//  SJFeedListViewController+Configure.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController+Configure.h"
#import <MJRefresh/MJRefresh.h>

@implementation SJFeedListViewController (Configure)

- (void)initProperties {
  self.cellModels = [NSMutableArray array];
}

- (void)configureViews {
  self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
  self.tableView.estimatedRowHeight = 40;
  self.tableView.estimatedSectionHeaderHeight = 0;
  self.tableView.estimatedSectionFooterHeight = 0;
  [self.view addSubview:self.tableView];
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.mas_equalTo(0);
  }];
  self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
  self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
  
  self.tableView.sj_oneSectionRowArray = self.cellModels;
  __weak typeof(self) wSelf = self;
  self.tableView.sj_didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    __strong typeof(wSelf) self = wSelf;
    [self didSelectRowAtIndexPath:indexPath];
  };
}

@end
