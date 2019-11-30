//
//  SJLeftTitleRightCopyCellModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/29.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJLeftTitleRightCopyCellModel : NSObject<SJTableViewCellModelProtocol>

@property (nonatomic, copy) NSString *leftTitle;

@property (nonatomic, copy) void(^copyButtonClickedBlock)(SJLeftTitleRightCopyCellModel *cellModel);

@property (nonatomic, assign) BOOL isExpanded;

@end

NS_ASSUME_NONNULL_END
