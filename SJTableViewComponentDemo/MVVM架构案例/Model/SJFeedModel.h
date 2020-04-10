//
//  SJFeedModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJFeedModel : NSObject

@property (nonatomic, copy) NSString *feedId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *feedImageURL;

- (void)updateWithResponseData:(NSDictionary *)responseData;

@end

NS_ASSUME_NONNULL_END
