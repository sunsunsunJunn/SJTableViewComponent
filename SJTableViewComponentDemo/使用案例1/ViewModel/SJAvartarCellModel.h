//
//  SJAvartarCellModel.h
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/28.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SJAvartarCellModel : NSObject<SJTableViewCellModelProtocol>

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, copy) NSString *avartarURL;

+ (instancetype)avartarCellModelByLeftTitle:(NSString *)leftTitle
																 avartarURL:(NSString *)avartarURL;
@end

NS_ASSUME_NONNULL_END
