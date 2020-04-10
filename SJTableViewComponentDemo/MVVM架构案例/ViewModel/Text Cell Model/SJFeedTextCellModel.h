//
//  SJFeedTextCellModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJFeedModel.h"

NS_ASSUME_NONNULL_BEGIN

// 原始数据转化为cell需要数据的处理
@interface SJFeedTextCellModel : NSObject <SJTableViewCellModelProtocol>

@property (nonatomic, strong) SJFeedModel *feedModel;

@property (nonatomic, copy, readonly) NSString *titleText;
@property (nonatomic, copy, readonly) NSString *descText;

- (instancetype)initWithFeedModel:(SJFeedModel *)feedModel;

@end

NS_ASSUME_NONNULL_END
