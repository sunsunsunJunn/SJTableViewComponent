//
//  SJAvartarCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJAvartarCell.h"
#import "SJAvartarCellModel.h"

@interface SJAvartarCell ()

@property (nonatomic, strong) UILabel *avartarLabel;
@property (nonatomic, strong) UIImageView *avartarImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation SJAvartarCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self configureSubViews];
	}
	return self;
}

- (void)configureSubViews {
	self.avartarLabel = [[UILabel alloc] init];
	self.avartarLabel.textColor = [UIColor grayColor];
	self.avartarLabel.font = [UIFont systemFontOfSize:16];
	[self.contentView addSubview:self.avartarLabel];
	
	self.avartarImageView = [[UIImageView alloc] init];
	self.avartarImageView.layer.cornerRadius = 30;
	self.avartarImageView.layer.masksToBounds = YES;
	[self.contentView addSubview:self.avartarImageView];
	
	self.arrowImageView = [[UIImageView alloc] init];
  self.arrowImageView.image = [UIImage imageNamed:@"mk_return_goods_alert_arrow"];
	[self.contentView addSubview:self.arrowImageView];
	
	[self addMasnory];
}

- (void)addMasnory {
	[self.avartarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(15.f);
		make.centerY.mas_equalTo(0.f);
		make.right.mas_lessThanOrEqualTo(self.avartarImageView.mas_left).offset(-20);
	}];
	
	[self.avartarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-10);
		make.centerY.mas_equalTo(0.f);
		make.width.and.height.mas_equalTo(60.f);
	}];
	
	[self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.mas_equalTo(-15.f);
		make.centerY.mas_equalTo(0.f);
		make.size.mas_equalTo(CGSizeMake(10.f, 16.f));
	}];
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(nonnull id<SJTableViewCellModelProtocol>)cellModel {	
	SJAvartarCellModel *avartarModel = cellModel;
	
	self.avartarLabel.text = avartarModel.leftTitle;
	
	[self.avartarImageView sd_setImageWithURL:[NSURL URLWithString:avartarModel.avartarURL]];	
}

@end
