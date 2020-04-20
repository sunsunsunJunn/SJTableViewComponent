//
//  SJFeedListViewController+Adapter.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/20.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController+Adapter.h"

@implementation SJFeedListViewController (Adapter)

- (NSArray<id<SJTableViewCellModelProtocol>> *)feedModelsWithFeedListDatas:(NSArray *)feedListDatas {
  NSMutableArray *feedModels = [NSMutableArray array];
  for (NSDictionary *feedDictionary in feedListDatas) {
    SJFeedModel *feedModel = [[SJFeedModel alloc] init];
    [feedModel updateWithResponseData:feedDictionary];
    [feedModels addObject:feedModel];
  }

  return feedModels;
}


- (NSArray<id<SJTableViewCellModelProtocol>> *)cellModelsWithFeedModels:(NSArray *)feedModels {
  NSMutableArray *cellModels = [NSMutableArray array];
  for (SJFeedModel *feedModel in feedModels) {
    [cellModels addObject:[self cellModelWithFeedModel:feedModel]];
  }
  
  return cellModels;
}

- (id<SJTableViewCellModelProtocol>)cellModelWithFeedModel:(SJFeedModel *)feedModel {
  id<SJTableViewCellModelProtocol> cellModel;
  if (feedModel.feedImageURL.length) {
    SJFeedImageCellModel *imageCellModel = [[SJFeedImageCellModel alloc] init];
    imageCellModel.feedModel = feedModel;
    imageCellModel.sj_cellHeight = 140;
    __weak typeof(self) wSelf = self;
    imageCellModel.detailButtonClickBlock = ^(SJFeedImageCellModel * _Nonnull cellModel) {
      __strong typeof(wSelf) self = wSelf;
      [self detailButtonClickedInCellModel:cellModel];
    };
    imageCellModel.deleteButtonClickBlock = ^(SJFeedImageCellModel * _Nonnull cellModel) {
      __strong typeof(wSelf) self = wSelf;
      [self deleteButtonClickedInCellModel:cellModel];
    };
    
    cellModel = imageCellModel;
    
  } else {
    SJFeedTextCellModel *textCellModel = [[SJFeedTextCellModel alloc] init];
    textCellModel.feedModel = feedModel;
    textCellModel.sj_cellHeight = UITableViewAutomaticDimension;

    cellModel = textCellModel;
  }
  
  return cellModel;
}

- (void)deleteCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
  [self.tableView.sj_oneSectionRowArray removeObject:cellModel];
  self.currentCount = self.tableView.sj_oneSectionRowArray.count;
}

@end
