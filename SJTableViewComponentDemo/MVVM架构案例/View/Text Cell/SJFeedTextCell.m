//
//  SJFeedTextCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedTextCell.h"
#import "SJFeedTextCellModel.h"

@interface SJFeedTextCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (nonatomic, strong) SJFeedTextCellModel *textCellModel;

@end

@implementation SJFeedTextCell

- (void)awakeFromNib {
  [super awakeFromNib];
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
  self.textCellModel = cellModel;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  self.titleLabel.text = self.textCellModel.titleText;
  
  self.descLabel.text = self.textCellModel.descText;
}

@end
