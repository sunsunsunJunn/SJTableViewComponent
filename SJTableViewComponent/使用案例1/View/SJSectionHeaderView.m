//
//  SJSectionHeaderView.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJSectionHeaderView.h"

@implementation SJSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
		self.contentView.backgroundColor = [UIColor lightGrayColor];
	}
	return self;
}

- (void)sj_configureHeaderFooterByHeaderFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)headerFooterModel {
	
}

@end
