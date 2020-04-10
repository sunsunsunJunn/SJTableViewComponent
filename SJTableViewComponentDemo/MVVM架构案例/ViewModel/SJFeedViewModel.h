//
//  SJFeedViewModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJFeedTextCellModel.h"
#import "SJFeedImageCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedViewModel : NSObject

@property (nonatomic, assign) NSInteger currentCount;
@property (nonatomic, assign) BOOL isLastPage;

@property (nonatomic, copy) void (^deleteButtonClickCallback)(SJFeedImageCellModel *cellModel);
@property (nonatomic, copy) void (^detailButtonClickCallback)(SJFeedImageCellModel *cellModel);
@property (nonatomic, strong, readonly) NSMutableArray *cellModels;
@property (nonatomic, strong, readonly) NSMutableArray *feedModels;

- (void)deleteCellModel:(id<SJTableViewCellModelProtocol>)cellModel;

- (SJFeedModel *)feedModelWithFeedDictionay:(NSDictionary *)feedDictionay;
- (id<SJTableViewCellModelProtocol>)cellModelWithFeedModel:(SJFeedModel *)feedModel;

- (instancetype)initWithFeedListDatas:(NSArray *)feedListDatas;

@end

NS_ASSUME_NONNULL_END
