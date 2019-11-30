//
//  SJLeftTitleRightArrowCellModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJLeftTitleRightArrowCellModel : NSObject<SJTableViewCellModelProtocol>

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *arrowLocalPath;

+ (instancetype)leftTitleRightArrowCellModelByLeftTitle:(NSString *)leftTitle
																 arrowLocalPath:(NSString *)arrowLocalPath;

@end

NS_ASSUME_NONNULL_END
