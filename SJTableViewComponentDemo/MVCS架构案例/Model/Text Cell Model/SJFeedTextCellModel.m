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

#pragma mark - SJTableViewCellModelProtocol

- (Class<SJTableViewCellProtocol>)sj_cellClass {
  return SJFeedTextCell.class;
}

@end
