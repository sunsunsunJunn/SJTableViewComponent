//
//  SJFeedListViewController.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJFeedTextCellModel.h"
#import "SJFeedImageCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedListViewController : UIViewController

@property (nonatomic, assign) NSInteger currentCount;
@property (nonatomic, assign) BOOL isLastPage;

@property (nonatomic, strong) UITableView *tableView;

- (void)loadNewData;
- (void)loadMoreData;
- (void)reloadData;
- (void)stopRefresh;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)detailButtonClickedInCellModel:(SJFeedImageCellModel *)cellModel;
- (void)deleteButtonClickedInCellModel:(SJFeedImageCellModel *)cellModel;

@end

NS_ASSUME_NONNULL_END
