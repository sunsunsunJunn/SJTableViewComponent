//
//  SJFeedListViewController+LogicFlow.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2020/4/14.
//  Copyright © 2020 SUNJUN. All rights reserved.
//

#import "SJFeedListViewController+LogicFlow.h"
#import "SJFeedListViewController+Adapter.h"

@implementation SJFeedListViewController (LogicFlow)

- (void)loadFeedList {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0.5), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
      NSString *errorMsg = @"";
      if (errorMsg.length) {
        //toast
      } else {
        [self handleResponseData:self.responseData];
      }
      
      [self stopRefresh];
      [self reloadData];
    });
  });
}

- (void)handleResponseData:(NSDictionary *)responseData {
  if (self.currentCount == 0) {
    [self.tableView.sj_oneSectionRowArray removeAllObjects];
  }
  
  NSArray *feedList = self.responseData[@"feedList"];
  for (NSDictionary *feedDictionary in feedList) {
    SJFeedModel *feedModel = [[SJFeedModel alloc] init];
    [feedModel updateWithResponseData:feedDictionary];
    [self.tableView.sj_oneSectionRowArray addObject:[self cellModelWithFeedModel:feedModel]];
  }
    
  self.currentCount = self.tableView.sj_sectionArray.count;
  self.isLastPage = self.tableView.sj_sectionArray.count > 20;
}

#pragma mark - 模拟数据

- (NSDictionary *)responseData {
  return @{
    @"feedList" : @[
        @{
          @"feedId"  : @"4",
          @"title"   : @"斯里兰卡",
          @"content" : @"世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理。"
        },
        @{
          @"feedId"  : @"5",
          @"title"   : @"巴尔扎克",
          @"content" : @"过放荡不羁的生活，容易得像顺水推舟，但是要结识良朋益友，却难如登天。"
        },
        @{
          @"feedId"  : @"6",
          @"title"   : @"歌德",
          @"content" : @"这世界要是没有爱情，它在我们心中还会有什么意义！这就如一盏没有亮光的走马灯。",
          @"feedImageURL" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586513923138&di=ce1204f95c4347581d1e2b8db576541d&imgtype=0&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D1337937658%2C1749408431%26fm%3D214%26gp%3D0.jpg"
        },
        @{
          @"feedId"  : @"7",
          @"title"   : @"赫尔巴特",
          @"content" : @"相信谎言的人必将在真理之前毁灭。"
        },
        @{
          @"feedId"  : @"8",
          @"title"   : @"何其芳",
          @"content" : @"爱情原如树叶一样，在人忽视里绿了，在忍耐里露出蓓蕾。"
        },
        @{
          @"feedId"  : @"9",
          @"title"   : @"纪伯伦",
          @"content" : @"一件事实是一条没有性别的真理。",
          @"feedImageURL" : @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586513957059&di=5e075c28d2aaaddf626521b2c82b4a54&imgtype=0&src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F9551449616%2F1000.jpg"
        },
        @{
          @"feedId"  : @"10",
          @"title"   : @"柯尔律治",
          @"content" : @"友谊是一棵可以庇荫的树。"
        },
        @{
          @"feedId"  : @"11",
          @"title"   : @"高尔基",
          @"content" : @"我读的书愈多，就愈亲近世界，愈明了生活的意义，愈觉得生活的重要。"
        }
    ]
  };
}

@end
