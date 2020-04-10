//
//  SJFeedViewModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedViewModel.h"
#import "SJFeedViewModel+LogicFlow.h"

@interface SJFeedViewModel ()

@property (nonatomic, strong) NSMutableArray *cellModels;
@property (nonatomic, strong) NSMutableArray *feedModels;

@end

@implementation SJFeedViewModel

- (instancetype)initWithFeedListDatas:(NSArray *)feedListDatas {
  if (self = [super init]) {
    self.currentCount = feedListDatas.count;
    [self.feedModels addObjectsFromArray:[self feedModelsWithFeedListDatas:feedListDatas]];
    [self.cellModels addObjectsFromArray:[self cellModelsWithFeedModels:self.feedModels]];
  }
  return self;
}

#pragma mark - Private Methods

- (NSArray<id<SJTableViewCellModelProtocol>> *)feedModelsWithFeedListDatas:(NSArray *)feedListDatas {
  NSMutableArray *feedModels = [NSMutableArray array];
  for (NSDictionary *feedDictionary in feedListDatas) {
    SJFeedModel *feedModel = [self feedModelWithFeedDictionay:feedDictionary];
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

- (SJFeedModel *)feedModelWithFeedDictionay:(NSDictionary *)feedDictionay  {
  SJFeedModel *feedModel = [[SJFeedModel alloc] init];
  [feedModel updateWithResponseData:feedDictionay];
  return feedModel;
}

- (id<SJTableViewCellModelProtocol>)cellModelWithFeedModel:(SJFeedModel *)feedModel {
  id<SJTableViewCellModelProtocol> cellModel;
  if (feedModel.feedImageURL.length) {
    SJFeedImageCellModel *imageCellModel = [[SJFeedImageCellModel alloc] initWithFeedModel:feedModel];
    imageCellModel.sj_cellHeight = 140;
    __weak typeof(self) wSelf = self;
    imageCellModel.detailButtonClickBlock = ^(SJFeedImageCellModel * _Nonnull cellModel) {
      __strong typeof(wSelf) self = wSelf;
      !self.detailButtonClickCallback ?: self.detailButtonClickCallback(cellModel);
    };
    imageCellModel.deleteButtonClickBlock = ^(SJFeedImageCellModel * _Nonnull cellModel) {
      __strong typeof(wSelf) self = wSelf;
      !self.deleteButtonClickCallback ?: self.deleteButtonClickCallback(cellModel);
    };
    
    cellModel = imageCellModel;
    
  } else {
    SJFeedTextCellModel *textCellModel = [[SJFeedTextCellModel alloc] initWithFeedModel:feedModel];
    textCellModel.sj_cellHeight = UITableViewAutomaticDimension;
    
    cellModel = textCellModel;
  }
  
  return cellModel;
}

- (void)deleteCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
  [self.cellModels removeObject:cellModel];
  self.currentCount = self.cellModels.count;
}

#pragma mark - Setter Getter

- (NSMutableArray *)cellModels {
  if (!_cellModels) {
    _cellModels = [NSMutableArray array];
  }
  return _cellModels;
}

- (NSMutableArray *)feedModels {
  if (!_feedModels) {
    _feedModels = [NSMutableArray array];
  }
  return _feedModels;
}

@end
