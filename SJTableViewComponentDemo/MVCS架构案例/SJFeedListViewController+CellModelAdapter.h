//
//  SJFeedListViewController+CellModelAdapter.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/14.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedListViewController (CellModelAdapter)

- (SJFeedModel *)feedModelWithFeedDictionay:(NSDictionary *)feedDictionay;
- (id<SJTableViewCellModelProtocol>)cellModelWithFeedModel:(SJFeedModel *)feedModel;

- (void)deleteCellModel:(id<SJTableViewCellModelProtocol>)cellModel;

@end

NS_ASSUME_NONNULL_END
