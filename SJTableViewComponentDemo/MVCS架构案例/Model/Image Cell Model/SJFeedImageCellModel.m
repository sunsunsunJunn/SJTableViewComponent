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

#pragma mark - SJTableViewCellModelProtocol

- (Class<SJTableViewCellProtocol>)sj_cellClass {
  return SJFeedImageCell.class;
}

@end
