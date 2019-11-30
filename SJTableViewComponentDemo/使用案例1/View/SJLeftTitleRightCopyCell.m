//
//  SJLeftTitleRightCopyCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/29.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJLeftTitleRightCopyCell.h"
#import "SJLeftTitleRightCopyCellModel.h"

@interface SJLeftTitleRightCopyCell ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) SJLeftTitleRightCopyCellModel *cellModel;

@end

@implementation SJLeftTitleRightCopyCell

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
	
	self.moreButton = [[UIButton alloc] init];
	self.moreButton.titleLabel.font = [UIFont systemFontOfSize:14];
	[self.moreButton setTitle:@"更多" forState:UIControlStateNormal];
	[self.moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.moreButton addTarget:self action:@selector(copyTitleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
	self.moreButton.layer.borderWidth = 1;
	self.moreButton.layer.borderColor = [UIColor blackColor].CGColor;
	[self.contentView addSubview:self.moreButton];
	
	[self addMasnory];
}

- (void)addMasnory {
	[self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(15.f);
		make.top.mas_equalTo(15.f);
		make.right.mas_lessThanOrEqualTo(self.moreButton.mas_left).offset(-20);
		make.bottom.mas_equalTo(-15.f);
	}];
	
	[self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(-20.f);
		make.bottom.mas_equalTo(-15.f);
		make.size.mas_equalTo(CGSizeMake(60.f, 20.f));
	}];
}

- (void)copyTitleButtonClicked {
	if (self.cellModel.copyButtonClickedBlock) {
		self.cellModel.copyButtonClickedBlock(self.cellModel);
	}
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(nonnull id<SJTableViewCellModelProtocol>)cellModel {
	self.cellModel = cellModel;
	
	self.leftLabel.text = self.cellModel.leftTitle;
	
	[self.moreButton setTitle:self.cellModel.isExpanded ? @"收起" : @"更多" forState:UIControlStateNormal];
	
	self.leftLabel.numberOfLines = self.cellModel.isExpanded ? 0 : 2;
}

@end
