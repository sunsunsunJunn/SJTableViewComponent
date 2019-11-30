//
//  SJLeftTitleRightArrowCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightArrowCellModel.h"
#import "SJLeftTitleRightArrowCell.h"

@implementation SJLeftTitleRightArrowCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

+ (instancetype)leftTitleRightArrowCellModelByLeftTitle:(NSString *)leftTitle arrowLocalPath:(NSString *)arrowLocalPath {
	SJLeftTitleRightArrowCellModel *model = [[SJLeftTitleRightArrowCellModel alloc] init];
	model.leftTitle = leftTitle;
	model.arrowLocalPath = arrowLocalPath;
	model.sj_cellHeight = 70.f;
	return model;
}

- (Class<SJTableViewCellProtocol>)sj_cellClass {
	return [SJLeftTitleRightArrowCell class];
}


@end
