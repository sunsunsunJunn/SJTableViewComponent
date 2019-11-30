//
//  SJLeftTitleRightTitleCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightTitleCell.h"
#import "SJLeftTitleRightTitleCellModel.h"

@interface SJLeftTitleRightTitleCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation SJLeftTitleRightTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self configureSubViews];
	}
	return self;
}

- (void)configureSubViews {
	self.leftLabel = [[UILabel alloc] init];
	self.leftLabel.textColor = [UIColor grayColor];
	self.leftLabel.font = [UIFont systemFontOfSize:16];
	[self.contentView addSubview:self.leftLabel];
	
	self.rightLabel = [[UILabel alloc] init];
	self.rightLabel.textColor = [UIColor grayColor];
	self.rightLabel.font = [UIFont systemFontOfSize:16];
	[self.contentView addSubview:self.rightLabel];
	
	[self addMasnory];
}

- (void)addMasnory {
	[self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(15.f);
		make.centerY.mas_equalTo(0.f);
		make.width.mas_lessThanOrEqualTo(100.f);
	}];
	
	[self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(-15.f);
		make.centerY.mas_equalTo(0.f);
		make.left.mas_lessThanOrEqualTo(self.rightLabel.mas_right).offset(20);
	}];
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
	SJLeftTitleRightTitleCellModel *titleModel = cellModel;
	
	self.leftLabel.text = titleModel.leftTitle;
	
	self.rightLabel.text = titleModel.rightTitle;
}

@end
