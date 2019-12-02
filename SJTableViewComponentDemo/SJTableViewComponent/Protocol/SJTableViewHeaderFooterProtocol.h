//
//  SJTableViewHeaderFooterProtocol.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SJTableViewHeaderFooterModelProtocol;

NS_ASSUME_NONNULL_BEGIN

/**
 UITableViewHeaderFooterView 配置协议
 */
@protocol SJTableViewHeaderFooterProtocol <NSObject>

@optional

/**
* @brief 根据数据配置header/footer的UI
*
* @param headerFooterModel 数据模型
*/
- (void)sj_configureHeaderFooterByHeaderFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)headerFooterModel;

/**
 * @brief 根据数据配置header/footer的UI
 *
 * @param headerFooterModel 数据模型
 * @param section           头所在的section
 */
- (void)sj_configureHeaderFooterByHeaderFooterModel:(id<SJTableViewHeaderFooterModelProtocol>)headerFooterModel inSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
