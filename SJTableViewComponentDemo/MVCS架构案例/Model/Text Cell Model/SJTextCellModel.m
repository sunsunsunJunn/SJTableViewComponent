//
//  SJTextCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedTextCellModel.h"
#import "SJTextCell.h"

@implementation SJFeedTextCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

#pragma mark - SJTableViewCellModelProtocol

- (Class<SJTableViewCellProtocol>)sj_cellClass {
  return <#expression#>;
}


@end
