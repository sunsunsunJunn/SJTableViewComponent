//
//  SJTableViewViewModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/29.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJMineModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SJTableViewViewModel : NSObject

- (void)startRequestWithSuccess:(void (^)(NSArray<SJMineModel *> * modelArray))success;

@end

NS_ASSUME_NONNULL_END
