//
//  SJTableViewViewModel.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/3/29.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJTableViewViewModel.h"

@implementation SJTableViewViewModel

- (void)startRequestWithSuccess:(void (^)(NSArray<SJMineModel *> * _Nonnull))success {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0.1), ^{
    //数据转模型
    NSMutableArray *modelArray = [NSMutableArray array];
    for (NSDictionary *dataDic in self.dataArray) {
      SJMineModel *model = [SJMineModel new];
      model.leftTitle = dataDic[@"leftTitle"];
      model.rightTitle = dataDic[@"rightTitle"];
      model.avartarURL = dataDic[@"avartar"];
      NSNumber *type = dataDic[@"type"];
      model.type = type.integerValue;
      [modelArray addObject:model];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
      success(modelArray);
    });
  });
}

- (NSArray *)dataArray {
  return @[
    @{@"leftTitle":@"头像",
      @"rightTitle": @"",
      @"avartar":@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1574941816&di=f0adb7ee79202e5f51577fd34f7c17e4&src=http://b-ssl.duitang.com/uploads/item/201409/30/20140930222602_GP5jS.jpeg",
      @"type":@(SJMineModelTypeAvartar)},
    
    @{@"leftTitle":@"名字",
    @"rightTitle": @"",
    @"avartar":@"",
    @"type":@(SJMineModelTypeLeftTitleRightArrow)},
    
    @{@"leftTitle":@"微信号",
    @"rightTitle": @"Stephen",
    @"avartar":@"",
    @"type":@(SJMineModelTypeLeftTitleRightTitle)},
    
    @{@"leftTitle":@"更多",
    @"rightTitle": @"",
    @"avartar":@"",
    @"type":@(SJMineModelTypeLeftTitleRightArrow)},
    
    @{@"leftTitle":@"我的地址",
    @"rightTitle": @"",
    @"avartar":@"",
    @"type":@(SJMineModelTypeLeftTitleRightArrow)},
    
    @{@"leftTitle":@"这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字这里是需要放大的文字",
    @"rightTitle": @"",
    @"avartar":@"",
    @"type":@(SJMineModelTypeLeftTitleRightCopy)},
  ];
}

@end
