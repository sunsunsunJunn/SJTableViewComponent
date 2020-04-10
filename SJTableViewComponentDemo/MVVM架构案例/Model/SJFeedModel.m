//
//  SJFeedModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedModel.h"

@implementation SJFeedModel

- (void)updateWithResponseData:(NSDictionary *)responseData {
  self.feedId = responseData[@"feedId"];
  self.title = responseData[@"title"];
  self.content = responseData[@"content"];
  self.feedImageURL = responseData[@"feedImageURL"];
}

@end
