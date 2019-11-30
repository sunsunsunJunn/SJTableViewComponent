//
//  SJTableViewCellModelProtocol.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SJTableViewCellProtocol;

NS_ASSUME_NONNULL_BEGIN

/**
 UITableView cell 模型 配置协议
 */
@protocol SJTableViewCellModelProtocol <NSObject>

@required

/** CellModel对应的Cell的类型 */
- (Class<SJTableViewCellProtocol>)sj_cellClass;

/** CellModel对应的Cell的高度 设置为0是自动计算 设置>0则是设置的固定高度 */
@property (nonatomic, assign) CGFloat sj_cellHeight;

@optional

/** cell 对应的数据模型 */
- (id)sj_cellModel;

@end

NS_ASSUME_NONNULL_END
