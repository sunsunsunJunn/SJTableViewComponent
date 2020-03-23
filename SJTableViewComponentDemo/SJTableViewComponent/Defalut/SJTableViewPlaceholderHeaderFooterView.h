//
//  SJTableViewPlaceholderHeaderFooterView.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/23.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTableViewHeaderFooterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
* 配置默认样式HeaderFooterView，用于快速构建占位HeaderFooter
* 样式: 带有颜色的占位headerFooterView
*/
@interface SJTableViewPlaceholderHeaderFooterView : UITableViewHeaderFooterView <SJTableViewHeaderFooterProtocol>

@end

NS_ASSUME_NONNULL_END
