//
//  UITableView+SJComponent.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJTableViewCellProtocol.h"
#import "SJTableViewCellModelProtocol.h"
#import "SJTableViewHeaderFooterProtocol.h"
#import "SJTableViewHeaderFooterModelProtocol.h"
#import "SJTableViewSection.h"
#import "SJTableViewImplement.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (SJComponent)

#pragma mark - tableView数据设置

/** 一个 section，UITableView 的 cellModel 配置数组 */
@property (nonatomic, strong) NSMutableArray<id<SJTableViewCellModelProtocol>> *sj_oneSectionRowArray;
/** 一个 section，header 配置 */
@property (nonatomic, strong, nullable) id<SJTableViewHeaderFooterModelProtocol> sj_oneSectionHeaderModel;
/** 一个 section，footer 配置 */
@property (nonatomic, strong, nullable) id<SJTableViewHeaderFooterModelProtocol> sj_oneSectionFooterModel;

/** 一个或多个 section */
@property (nonatomic, strong, nullable) NSMutableArray<SJTableViewSection *> *sj_sectionArray;

/** tableView的代理实现类 */
@property (nonatomic, strong) SJTableViewImplement *sj_tableViewImplement;

/** 获取indexPath 对应的cellModel */
- (id<SJTableViewCellModelProtocol>)sj_cellModelForIndexPath:(NSIndexPath *)indexPath;

/** 获取cellModel 对应的indexPath */
- (NSIndexPath *)sj_indexPathForCellModel:(id<SJTableViewCellModelProtocol>)cellModel;

#pragma mark - tableView的一些回调处理

/**
 * tableView将要配置cell的回调(可在此设置一些cell的其他属性)
 */
@property (nonatomic, copy) void(^sj_cellForRowAtIndexPathBlock)(UITableViewCell *cell, NSIndexPath *indexPath);

/**
 * tableView 点击的回调每一个cell的回调
 */
@property (nonatomic, copy) void(^sj_didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

/**
 * tableView 滚动的回调
 */
@property (nonatomic, copy) void(^sj_scrollViewDidScrollBlock)(UIScrollView *scrollView);

@end

NS_ASSUME_NONNULL_END
