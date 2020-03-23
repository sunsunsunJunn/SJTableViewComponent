//
//  SJTableViewPlaceholderHeaderFooterModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/23.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJTableViewPlaceholderHeaderFooterModel.h"
#import "SJTableViewPlaceholderHeaderFooterView.h"

@implementation SJTableViewPlaceholderHeaderFooterModel

- (instancetype)init {
  if (self = [super init]) {
    _height = 10;
    _backgroundColor = [UIColor whiteColor];
  }
  return self;
}

#pragma mark - SJTableViewHeaderFooterModelProtocol

- (CGFloat)sj_headerFooterHeight {
  return self.height;
}

- (Class)sj_headerFooterClass {
  return SJTableViewPlaceholderHeaderFooterView.class;
}

@end
