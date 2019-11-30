//
//  SJLeftTitleRightCopyCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/29.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightCopyCellModel.h"
#import "SJLeftTitleRightCopyCell.h"

@implementation SJLeftTitleRightCopyCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

- (Class<SJTableViewCellProtocol>)sj_cellClass {
	return SJLeftTitleRightCopyCell.class;
}

@end
