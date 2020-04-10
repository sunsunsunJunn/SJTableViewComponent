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
  self.viewModel = [[SJFeedViewModel alloc] initWithFeedListDatas:self.defaultFeedList];
  __weak typeof(self) wSelf = self;
  self.viewModel.detailButtonClickCallback = ^(SJFeedImageCellModel * _Nonnull cellModel) {
    __strong typeof(wSelf) self = wSelf;
    [self detailButtonClickedInCellModel:cellModel];
  };
  self.viewModel.deleteButtonClickCallback = ^(SJFeedImageCellModel * _Nonnull cellModel) {
    __strong typeof(wSelf) self = wSelf;
    [self deleteButtonClickedInCellModel:cellModel];
  };
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
  
  self.tableView.sj_oneSectionRowArray = self.viewModel.cellModels;
  __weak typeof(self) wSelf = self;
  self.tableView.sj_didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
    __strong typeof(wSelf) self = wSelf;
    [self didSelectRowAtIndexPath:indexPath];
  };
}


- (NSArray *)defaultFeedList {
  return @[
    @{
      @"feedId"  : @"1",
      @"title"   : @"别林斯基",
      @"content" : @"土地是以它的肥沃和收获而被估价的；才能也是土地，不过它生产的不是粮食，而是真理。如果只能滋生瞑想和幻想的话，即使再大的才能也只是砂地或盐池，那上面连小草也长不出来的。"
    },
    @{
      @"feedId"  : @"2",
      @"title"   : @"德奥弗拉斯多",
      @"content" : @"时间是一切财富中最宝贵的财富。"
    },
    @{
      @"feedId"  : @"3",
      @"title"   : @"欧文",
      @"content" : @"真理惟一可靠的标准就是永远自相符合。"
    }
  ];
}

@end
