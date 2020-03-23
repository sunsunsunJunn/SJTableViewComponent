//
//  SJTableViewCellProtocol.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SJTableViewCellModelProtocol;

NS_ASSUME_NONNULL_BEGIN

/**
 * UITableView cell 配置协议
 */
@protocol SJTableViewCellProtocol <NSObject>

@optional

/**
 * @brief  根据数据配置Cell的UI
 *
 * @param  cellModel cell对应的数据
 */
- (void)sj_configureCellByCellModel:(id<SJTableViewCellModelProtocol>)cellModel;

/**
 * @brief  根据数据配置Cell的UI
 *
 * @param  cellModel cell对应的数据
 * @param  indexPath cell在tableView中的位置
 */
- (void)sj_configureCellByCellModel:(id<SJTableViewCellModelProtocol>)cellModel atIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
