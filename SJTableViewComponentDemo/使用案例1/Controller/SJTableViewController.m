//
//  SJTableViewController.m
//  SJTableViewComponent
//
//  Created by SUNJUN on 2019/11/26.
//  Copyright © 2019 SUNJUN. All rights reserved.
//

#import "SJTableViewController.h"
#import "SJAvartarCellModel.h"
#import "SJLeftTitleRightArrowCellModel.h"
#import "SJLeftTitleRightTitleCellModel.h"
#import "SJLeftTitleRightCopyCellModel.h"
#import "SJSectionHeaderViewModel.h"
#import "SJTableViewViewModel.h"

@interface SJTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SJTableViewViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SJTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
  [self loadData];
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  self.tableView.frame = self.view.bounds;
}

- (void)dealloc {
  NSLog(@"%@ dealloc", [self class]);
}

- (void)loadData {
  [self.viewModel startRequestWithSuccess:^(NSArray<SJMineModel *> * _Nonnull modelArray) {
    [self.dataArray addObjectsFromArray:modelArray];
    [self updateAllCellModels];
  }];
}

- (void)updateAllCellModels {
  //1.初始化所有 cellModel
  NSMutableArray *viewModelArray = [NSMutableArray array];

  for (SJMineModel *mineModel in self.dataArray) {
    // 根据和服务器约定的不同类型创建不同的 ViewModel
    switch (mineModel.type) {
      case SJMineModelTypeAvartar: {
        SJAvartarCellModel *avartar = [SJAvartarCellModel avartarCellModelByLeftTitle:mineModel.leftTitle avartarURL:mineModel.avartarURL];
        [viewModelArray addObject:avartar];
      }
        break;
        
      case SJMineModelTypeLeftTitleRightTitle: {
        SJLeftTitleRightTitleCellModel *number = [SJLeftTitleRightTitleCellModel leftTitleRightTitleCellModelByLeftTitle:mineModel.leftTitle rightTitle:mineModel.rightTitle];
        [viewModelArray addObject:number];
      }
        break;
        
      case SJMineModelTypeLeftTitleRightArrow: {
        SJLeftTitleRightArrowCellModel *name = [SJLeftTitleRightArrowCellModel leftTitleRightArrowCellModelByLeftTitle:mineModel.leftTitle];
        [viewModelArray addObject:name];
      }
        break;
        
      case SJMineModelTypeLeftTitleRightCopy: {
        SJLeftTitleRightCopyCellModel *copy = [[SJLeftTitleRightCopyCellModel alloc] init];
        copy.leftTitle = mineModel.leftTitle;
        __weak typeof(self) wSelf = self;
        copy.copyButtonClickedBlock = ^(SJLeftTitleRightCopyCellModel * _Nonnull cellModel) {
          NSLog(@"点击了放大文字");
          __strong typeof(wSelf) self = wSelf;
          //cell高度变化 需要清除高度缓存 重新计算
          [self.tableView sj_cleanCellHeightInCellModel:cellModel];
          cellModel.isExpanded = !cellModel.isExpanded;
          [self.tableView reloadRowsAtIndexPaths:@[[self.tableView sj_indexPathForCellModel:cellModel]] withRowAnimation:UITableViewRowAnimationFade];
        };
        [viewModelArray addObject:copy];
      }
        break;
    }
  }
  
  // 2.赋值并刷新
  [self.tableView.sj_oneSectionRowArray removeAllObjects];
  [self.tableView.sj_oneSectionRowArray addObjectsFromArray:viewModelArray];
  [self.tableView reloadData];
}

#pragma mark - Setter Getter

- (UITableView *)tableView {
  if (!_tableView) {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.estimatedRowHeight = 40;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    _tableView = tableView;
  }
  return _tableView;
}

- (NSMutableArray *)dataArray {
  if (!_dataArray) {
    _dataArray = [NSMutableArray array];
  }
  return _dataArray;
}

- (SJTableViewViewModel *)viewModel {
  if (!_viewModel) {
    _viewModel = [[SJTableViewViewModel alloc] init];
  }
  return _viewModel;
}

@end
