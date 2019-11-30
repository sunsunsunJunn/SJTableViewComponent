//
//  SJLeftTitleRightTitleCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightTitleCellModel.h"
#import "SJLeftTitleRightTitleCell.h"

@implementation SJLeftTitleRightTitleCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

+ (instancetype)leftTitleRightTitleCellModelByLeftTitle:(NSString *)leftTitle
																						 rightTitle:(NSString *)rightTitle {
	SJLeftTitleRightTitleCellModel *model = [[SJLeftTitleRightTitleCellModel alloc] init];
	model.leftTitle = leftTitle;
	model.rightTitle = rightTitle;
	model.sj_cellHeight = 70.f;
	return model;
}

- (nonnull Class<SJTableViewCellProtocol>)sj_cellClass {
	return [SJLeftTitleRightTitleCell class];
}

@end

