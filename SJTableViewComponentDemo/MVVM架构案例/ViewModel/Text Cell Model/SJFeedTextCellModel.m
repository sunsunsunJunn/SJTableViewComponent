//
//  SJFeedTextCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedTextCellModel.h"
#import "SJFeedTextCell.h"

@interface SJFeedTextCellModel ()

@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *descText;

@end

@implementation SJFeedTextCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

- (instancetype)initWithFeedModel:(SJFeedModel *)feedModel {
  if (self = [super init]) {
    self.feedModel = feedModel;
    self.titleText = [NSString stringWithFormat:@"标题：%@",self.feedModel.title];
    self.descText = [NSString stringWithFormat:@"内容：%@",self.feedModel.content];
  }
  return self;
}

#pragma mark - SJTableViewCellModelProtocol

- (Class<SJTableViewCellProtocol>)sj_cellClass {
  return SJFeedTextCell.class;
}

@end
