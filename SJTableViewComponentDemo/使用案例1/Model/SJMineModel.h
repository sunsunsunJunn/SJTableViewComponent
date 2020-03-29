//
//  SJMineModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/29.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SJMineModelType) {
  SJMineModelTypeAvartar,
  SJMineModelTypeLeftTitleRightTitle,
  SJMineModelTypeLeftTitleRightArrow,
  SJMineModelTypeLeftTitleRightCopy
};

@interface SJMineModel : NSObject

@property (nonatomic, assign) SJMineModelType type;

@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, copy) NSString *avartarURL;

@end

NS_ASSUME_NONNULL_END
