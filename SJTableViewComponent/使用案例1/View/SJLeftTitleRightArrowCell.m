//
//  SJLeftTitleRightArrowCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightArrowCell.h"
#import "SJLeftTitleRightArrowCellModel.h"

@interface SJLeftTitleRightArrowCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation SJLeftTitleRightArrowCell

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
	
	self.arrowImageView = [[UIImageView alloc] init];
	[self.contentView addSubview:self.arrowImageView];
	
	[self addMasnory];
}

- (void)addMasnory {
	[self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(15.f);
		make.centerY.mas_equalTo(0.f);
		make.right.mas_lessThanOrEqualTo(self.arrowImageView.mas_left).offset(-20);
	}];
	
	[self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(-15.f);
		make.centerY.mas_equalTo(0.f);
		make.size.mas_equalTo(CGSizeMake(10.f, 16.f));
	}];
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(nonnull id<SJTableViewCellModelProtocol>)cellModel {
	SJLeftTitleRightArrowCellModel *arrowModel = cellModel;
	
	self.leftLabel.text = arrowModel.leftTitle;
	
	self.arrowImageView.image = [UIImage imageNamed:arrowModel.arrowLocalPath];
}

@end
