//
//  SJAvartarCellModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJAvartarCellModel.h"
#import "SJAvartarCell.h"

@implementation SJAvartarCellModel

@synthesize sj_cellHeight = _sj_cellHeight;

+ (instancetype)avartarCellModelByLeftTitle:(NSString *)leftTitle avartarURL:(NSString *)avartarURL arrowLocalPath:(NSString *)arrowLocalPath {
	SJAvartarCellModel *model = [[SJAvartarCellModel alloc] init];
	model.leftTitle = leftTitle;
	model.avartarURL = avartarURL;
	model.arrowLocalPath = arrowLocalPath;
	model.sj_cellHeight = 70.f;
	return model;
}

- (nonnull Class<SJTableViewCellProtocol>)sj_cellClass {
	return [SJAvartarCell class];
}

@end
