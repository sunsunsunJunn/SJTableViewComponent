//
//  SJTableViewSection.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/23.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJTableViewHeaderFooterModelProtocol.h"
#import "SJTableViewCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 tableView中每一个Section的配置
 */
@interface SJTableViewSection : NSObject

/** UITableView 的 header 配置 */
@property (nonatomic, strong, nullable) id<SJTableViewHeaderFooterModelProtocol> header;

/** UITableView 的 footer 配置 */
@property (nonatomic, strong, nullable) id<SJTableViewHeaderFooterModelProtocol> footer;

/** UITableView 的 cellModel 配置数组 */
@property (nonatomic, strong) NSMutableArray<id<SJTableViewCellModelProtocol>> *rowArray;



@end

NS_ASSUME_NONNULL_END
