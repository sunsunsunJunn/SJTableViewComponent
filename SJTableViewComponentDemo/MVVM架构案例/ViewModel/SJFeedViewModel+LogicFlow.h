//
//  SJFeedViewModel+LogicFlow.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedViewModel.h"
#import "SJFeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedViewModel (LogicFlow)

- (void)loadFeedListCompletion:(void(^)(NSString *errorMsg))completion;

@end

NS_ASSUME_NONNULL_END
