//
//  SJFeedImageCell.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/10.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedImageCell.h"
#import "SJFeedImageCellModel.h"
#import <UIImageView+WebCache.h>

@interface SJFeedImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (nonatomic, strong) SJFeedImageCellModel *imageCellModel;

@end

@implementation SJFeedImageCell

- (void)awakeFromNib {
  [super awakeFromNib];
}

#pragma mark - Action Methods

- (IBAction)detailButtonClicked:(id)sender {
  !self.imageCellModel.detailButtonClickBlock ?: self.imageCellModel.detailButtonClickBlock(self.imageCellModel);
}

- (IBAction)deleteButtonClicked:(id)sender {
  !self.imageCellModel.deleteButtonClickBlock ?: self.imageCellModel.deleteButtonClickBlock(self.imageCellModel);
}

#pragma mark - SJTableViewCellProtocol

- (void)sj_configureCellByCellModel:(id<SJTableViewCellModelProtocol>)cellModel {
  self.imageCellModel = cellModel;
  [self reloadData];
}

#pragma mark - Private Methods

- (void)reloadData {
  [self.feedImageView sd_setImageWithURL:[NSURL URLWithString:self.imageCellModel.feedModel.feedImageURL]];

  self.titleLabel.text = self.imageCellModel.feedModel.title;
  
  self.descLabel.text = self.imageCellModel.feedModel.content;
}

@end
