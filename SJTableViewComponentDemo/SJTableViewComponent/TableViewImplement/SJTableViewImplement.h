//
//  SJTableViewImplement.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTableViewSection.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * UITableView中间代理实现类，delegate datasource 统一在此处理
 * 实现了部分代理会回调方法满足大部分需求 若想实现更多的代理方法，继承于该类在子类中拓展就行了。
 */
@interface SJTableViewImplement : NSObject <UITableViewDelegate, UITableViewDataSource>

/**
 * 数据列表
 */
@property (nonatomic, strong) NSArray<SJTableViewSection *> *sectionArray;

/**
 * 获取indexPath 对应的cellModel
 */
- (id<SJTableViewCellModelProtocol>)cellModelForIndexPath:(NSIndexPath *)indexPath;

/**
  * 获取cellModel 对应的indexPath
  */
- (NSIndexPath *)indexPathForCellModel:(id<SJTableViewCellModelProtocol>)cellModel;

/**
 * tableView将要配置cell的回调(可在此设置一些cell的其他属性)
 */
@property (nonatomic, copy) void(^willConfigureCellAtIndexPathBlock)(UITableViewCell *cell, NSIndexPath *indexPath);

/**
 * tableView 点击的回调每一个cell的回调
 */
@property (nonatomic, copy) void(^didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
