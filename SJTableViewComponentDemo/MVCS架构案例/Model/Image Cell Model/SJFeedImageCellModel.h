//
//  SJImageCellModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJFeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedImageCellModel : NSObject <SJTableViewCellModelProtocol>

@property (nonatomic, strong) SJFeedModel *feedModel;

@property (nonatomic, copy) void (^detailButtonClickBlock)(SJFeedImageCellModel *cellModel);
@property (nonatomic, copy) void (^deleteButtonClickBlock)(SJFeedImageCellModel *cellModel);

@end

NS_ASSUME_NONNULL_END
