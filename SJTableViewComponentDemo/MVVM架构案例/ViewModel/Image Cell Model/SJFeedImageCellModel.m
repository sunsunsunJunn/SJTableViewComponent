//
//  SJImageCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedImageCellModel.h"
#import "SJFeedImageCell.h"

@interface SJFeedImageCellModel ()

@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *descText;
@property (nonatomic, copy) NSString *feedImageURL;

@end

@implementation SJFeedImageCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

- (instancetype)initWithFeedModel:(SJFeedModel *)feedModel {
  if (self = [super init]) {
    self.feedModel = feedModel;
    self.titleText = [NSString stringWithFormat:@"标题：%@",self.feedModel.title];
    self.descText = [NSString stringWithFormat:@"内容：%@",self.feedModel.content];
    self.feedImageURL = self.feedModel.feedImageURL;
  }
  return self;
}

#pragma mark - SJTableViewCellModelProtocol

- (Class<SJTableViewCellProtocol>)sj_cellClass {
  return SJFeedImageCell.class;
}

@end
