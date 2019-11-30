//
//  SJSectionHeaderViewModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJSectionHeaderViewModel.h"
#import "SJSectionHeaderView.h"

@implementation SJSectionHeaderViewModel

- (Class)sj_headerFooterClass {
	return [SJSectionHeaderView class];
}

- (CGFloat)sj_headerFooterHeight {
	return 20.f;
}

@end
