//
//  SJTableViewPlaceholderHeaderFooterModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/23.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJTableViewHeaderFooterModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 配置默认样式实现类，用于快速构建占位HeaderFooter
 * 样式: 带有颜色的占位headerFooterView
 */
@interface SJTableViewPlaceholderHeaderFooterModel : NSObject <SJTableViewHeaderFooterModelProtocol>

/** 背景颜色，默认:白色 */
@property (nonatomic, strong) UIColor *backgroundColor;

/** 高度 默认：10 */
@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
