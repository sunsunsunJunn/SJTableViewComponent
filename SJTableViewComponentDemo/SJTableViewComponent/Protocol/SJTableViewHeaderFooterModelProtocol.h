//
//  SJTableViewHeaderFooterModelProtocol.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * UITableViewHeaderFooterView 模型 配置协议
 */
@protocol SJTableViewHeaderFooterModelProtocol <NSObject>

@required

/** header/footer 模型对应的header/footer视图的类型 */
- (Class)sj_headerFooterClass;

@optional

/** header/Footer 的高度 */
- (CGFloat)sj_headerFooterHeight;

/** header/Footer 对应的数据模型 */
- (id)sj_headerFooterModel;

/** header/footer 的复用标识 不设置的话是sj_headerFooterClass对应的string */
- (NSString *)sj_headerFooterReuseIdentifier;

@end

NS_ASSUME_NONNULL_END
