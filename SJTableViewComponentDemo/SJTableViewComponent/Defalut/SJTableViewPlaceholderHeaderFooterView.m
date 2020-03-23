//
//  SJTableViewPlaceholderHeaderFooterView.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/23.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJTableViewPlaceholderHeaderFooterView.h"
#import "SJTableViewPlaceholderHeaderFooterModel.h"

@implementation SJTableViewPlaceholderHeaderFooterView

#pragma mark - SJTableViewHeaderFooterProtocol

- (void)sj_configureHeaderFooterByHeaderFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)headerFooterModel {
  SJTableViewPlaceholderHeaderFooterModel *defaultModel = headerFooterModel;
  
  self.contentView.backgroundColor = defaultModel.backgroundColor;
}

@end
